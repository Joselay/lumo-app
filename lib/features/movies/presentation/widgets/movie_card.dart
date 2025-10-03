import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import '../../domain/entities/movie.dart';
import '../viewmodels/movies_bloc.dart';
import '../viewmodels/movies_event.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('movie-details', extra: movie);
      },
      child: Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CupertinoColors.systemBackground.resolveFrom(context),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 80,
                height: double.infinity,
                child: _buildPosterImage(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  if (movie.rating != null) ...[
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          size: 14,
                          color: CupertinoColors.systemYellow.resolveFrom(
                            context,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.rating!.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                  Expanded(
                    child: Text(
                      movie.description.isNotEmpty
                          ? movie.description
                          : 'No description available',
                      style: TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.systemGrey.resolveFrom(context),
                        height: 1.3,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.read<MoviesBloc>().add(
                      MoviesEvent.toggleFavorite(
                        movie.id,
                        movie.isFavorited,
                      ),
                    );
              },
              child: Icon(
                movie.isFavorited
                    ? lucide.LucideIcons.bookmark
                    : lucide.LucideIcons.bookmark,
                size: 24,
                color: movie.isFavorited
                    ? CupertinoColors.systemYellow
                    : CupertinoColors.systemGrey,
                fill: movie.isFavorited ? 1.0 : 0.0,
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildPosterImage() {
    if (movie.posterImage?.isNotEmpty == true) {
      return CachedNetworkImage(
        imageUrl: movie.posterImage!,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return Container(
            color: CupertinoColors.black,
            child: const Center(
              child: CupertinoActivityIndicator(
                radius: 12,
                color: CupertinoColors.white,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) => _buildPlaceholder(),
      );
    }
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      width: double.infinity,
      color: CupertinoColors.systemGrey6,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            lucide.LucideIcons.film,
            size: 32,
            color: CupertinoColors.systemGrey,
          ),
          SizedBox(height: 8),
          Text(
            'No Image',
            style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
          ),
        ],
      ),
    );
  }
}
