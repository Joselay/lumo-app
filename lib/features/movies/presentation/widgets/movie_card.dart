import 'package:flutter/cupertino.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import '../../domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      movie.description.isNotEmpty ? movie.description : 'No description available',
                      style: TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.systemGrey.resolveFrom(
                          context,
                        ),
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
        ],
      ),
    );
  }

  Widget _buildPosterImage() {
    if (movie.posterImage?.isNotEmpty == true) {
      return Image.network(
        movie.posterImage!,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildPlaceholder();
        },
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
