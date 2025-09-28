import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import '../../domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ShadCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: _buildPosterImage(),
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 2),

                    if (movie.genres.isNotEmpty) ...[
                      Flexible(
                        child: Text(
                          movie.genres.map((g) => g.name).join(', '),
                          style: TextStyle(
                            fontSize: 11,
                            color: CupertinoColors.systemGrey.resolveFrom(
                              context,
                            ),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 2),
                    ],

                    const Spacer(),

                    Row(
                      children: [
                        Icon(
                          lucide.LucideIcons.clock,
                          size: 10,
                          color: CupertinoColors.systemGrey.resolveFrom(
                            context,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Flexible(
                          child: Text(
                            movie.durationFormatted ?? '${movie.duration}m',
                            style: TextStyle(
                              fontSize: 10,
                              color: CupertinoColors.systemGrey.resolveFrom(
                                context,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (movie.rating != null) ...[
                          Icon(
                            lucide.LucideIcons.star,
                            size: 10,
                            color: CupertinoColors.systemYellow.resolveFrom(
                              context,
                            ),
                          ),
                          const SizedBox(width: 1),
                          Text(
                            movie.rating!.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 10,
                              color: CupertinoColors.systemGrey.resolveFrom(
                                context,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
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
