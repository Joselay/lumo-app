import 'package:flutter/cupertino.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;

class MovieSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const MovieSearchBar({
    super.key,
    required this.onSearch,
  });

  @override
  State<MovieSearchBar> createState() => _MovieSearchBarState();
}

class _MovieSearchBarState extends State<MovieSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: _controller,
      placeholder: 'Search movies...',
      onChanged: widget.onSearch,
      onSubmitted: widget.onSearch,
      prefixIcon: const Icon(lucide.LucideIcons.search),
      suffixIcon: const Icon(lucide.LucideIcons.x),
    );
  }
}