import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../domain/entities/movie.dart';

class GenreFilterChips extends StatelessWidget {
  final List<Genre> genres;
  final String? selectedGenreId;
  final Function(String?) onGenreSelected;

  const GenreFilterChips({
    super.key,
    required this.genres,
    this.selectedGenreId,
    required this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          if (index == 0) {
            final isSelected = selectedGenreId == null;
            if (isSelected) {
              return ShadButton(
                onPressed: () => onGenreSelected(null),
                decoration: ShadDecoration(
                  border: ShadBorder.all(radius: BorderRadius.circular(12)),
                ),
                child: const Text('All'),
              );
            } else {
              return ShadButton.outline(
                onPressed: () => onGenreSelected(null),
                decoration: ShadDecoration(
                  border: ShadBorder.all(radius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'All',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              );
            }
          }

          final genre = genres[index - 1];
          final isSelected = genre.id == selectedGenreId;

          if (isSelected) {
            return ShadButton(
              onPressed: () => onGenreSelected(genre.id),
              decoration: ShadDecoration(
                border: ShadBorder.all(radius: BorderRadius.circular(12)),
              ),
              child: Text(genre.name),
            );
          } else {
            return ShadButton.outline(
              onPressed: () => onGenreSelected(genre.id),
              decoration: ShadDecoration(
                border: ShadBorder.all(radius: BorderRadius.circular(12)),
              ),
              child: Text(
                genre.name,
                style: const TextStyle(color: CupertinoColors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
