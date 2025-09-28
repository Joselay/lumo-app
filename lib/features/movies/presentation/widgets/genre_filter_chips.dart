import 'package:flutter/cupertino.dart';
import '../../domain/entities/movie.dart';

class GenreFilterChips extends StatelessWidget {
  final List<Genre> genres;
  final String? selectedGenreId;
  final Function(String) onGenreSelected;

  const GenreFilterChips({
    super.key,
    required this.genres,
    this.selectedGenreId,
    required this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final genre = genres[index];
          final isSelected = genre.id == selectedGenreId;

          return CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.systemGrey6,
            onPressed: () => onGenreSelected(genre.id),
            child: Text(
              genre.name,
              style: TextStyle(
                fontSize: 14,
                color: isSelected
                    ? CupertinoColors.white
                    : CupertinoColors.label.resolveFrom(context),
              ),
            ),
          );
        },
      ),
    );
  }
}