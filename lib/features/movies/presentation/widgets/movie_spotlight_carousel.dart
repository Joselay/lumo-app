import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import '../../domain/entities/movie.dart';

class MovieSpotlightCarousel extends StatefulWidget {
  final List<Movie> movies;
  final void Function(Movie)? onMovieTap;

  const MovieSpotlightCarousel({
    super.key,
    required this.movies,
    this.onMovieTap,
  });

  @override
  State<MovieSpotlightCarousel> createState() => _MovieSpotlightCarouselState();
}

class _MovieSpotlightCarouselState extends State<MovieSpotlightCarousel> {
  static const _viewportFraction = 1.0;
  static const _autoPlayDuration = Duration(seconds: 4);
  static const _initialPage = 10000; // Large number for infinite effect
  late final PageController _controller;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: _viewportFraction,
      initialPage: _initialPage,
    );
    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    if (widget.movies.length <= 1) return;

    _autoPlayTimer = Timer.periodic(_autoPlayDuration, (timer) {
      if (!mounted || !_controller.hasClients) return;

      final currentPage = _controller.page?.round() ?? _initialPage;
      _controller.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  void _resetAutoPlay() {
    _autoPlayTimer?.cancel();
    _startAutoPlay();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 340,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final viewportWidth = constraints.maxWidth;
          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              PageView.builder(
                controller: _controller,
                padEnds: false,
                clipBehavior: Clip.none,
                onPageChanged: (index) {
                  _resetAutoPlay();
                },
                itemBuilder: (_, __) => const SizedBox.shrink(),
              ),
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    final page = _currentPage;
                    final layers = <_CardLayer>[];

                    final pageOffset = page - page.floor();

                    // Show visible movies around current position
                    for (var i = -2; i <= 2; i++) {
                      final movieIndex = ((page.floor() + i) % widget.movies.length + widget.movies.length) % widget.movies.length;
                      final movie = widget.movies[movieIndex];
                      final distance = i - pageOffset;
                      final depth = distance.abs();
                      final clampedDepth = depth.clamp(0.0, 1.0);
                      final isActive = depth < 0.35;

                      final translateX = distance * viewportWidth * 0.12;
                      final translateY = lerpDouble(0, 56, clampedDepth)!;
                      final scale = lerpDouble(1, 0.82, clampedDepth)!;
                      final tilt = -distance * 0.12;
                      final opacity = lerpDouble(1, 0.6, clampedDepth)!;

                      layers.add(
                        _CardLayer(
                          depth: depth,
                          widget: IgnorePointer(
                            ignoring: !isActive,
                            child: Align(
                              alignment: Alignment.center,
                              child: FractionallySizedBox(
                                widthFactor: 0.59,
                                child: Transform.translate(
                                  offset: Offset(translateX, translateY),
                                  child: Transform.rotate(
                                    angle: tilt,
                                    child: Transform.scale(
                                      scale: scale,
                                      child: Opacity(
                                        opacity: opacity,
                                        child: _MovieCard(
                                          key: ValueKey('${movie.id}_$i'),
                                          movie: movie,
                                          dimmed: !isActive,
                                          onTap: () =>
                                              widget.onMovieTap?.call(movie),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    layers.sort((a, b) => b.depth.compareTo(a.depth));

                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: layers.map((layer) => layer.widget).toList(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  double get _currentPage {
    if (_controller.positions.isEmpty || !_controller.position.haveDimensions) {
      return _initialPage.toDouble();
    }
    final page = _controller.page;
    if (page == null) {
      return _initialPage.toDouble();
    }
    return page;
  }
}

class _MovieCard extends StatelessWidget {
  final Movie movie;
  final bool dimmed;
  final VoidCallback? onTap;

  const _MovieCard({
    super.key,
    required this.movie,
    required this.dimmed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            if (!dimmed)
              BoxShadow(
                color: CupertinoColors.black.withValues(alpha: 0.28),
                blurRadius: 24,
                offset: const Offset(0, 16),
              )
            else
              BoxShadow(
                color: CupertinoColors.black.withValues(alpha: 0.2),
                blurRadius: 18,
                offset: const Offset(0, 12),
              ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildPoster(),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        CupertinoColors.black.withValues(
                          alpha: dimmed ? 0.4 : 0.22,
                        ),
                        CupertinoColors.black.withValues(
                          alpha: dimmed ? 0.65 : 0.45,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (movie.genres.isNotEmpty)
                      Text(
                        movie.genres.map((g) => g.name).join(' • '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: CupertinoColors.white.withValues(alpha: 0.85),
                          fontSize: 14,
                        ),
                      ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        if (movie.rating != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemYellow.withValues(
                                alpha: 0.9,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  CupertinoIcons.star_fill,
                                  size: 14,
                                  color: CupertinoColors.black,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  movie.rating!.toStringAsFixed(1),
                                  style: const TextStyle(
                                    color: CupertinoColors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (movie.rating != null) const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.black.withValues(
                              alpha: 0.35,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: CupertinoColors.white.withValues(
                                alpha: 0.2,
                              ),
                              width: 0.5,
                            ),
                          ),
                          child: Text(
                            movie.durationFormatted ?? '${movie.duration}m',
                            style: const TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPoster() {
    if (movie.posterImage?.isNotEmpty == true) {
      return Image.network(
        movie.posterImage!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _placeholder();
        },
        errorBuilder: (context, error, stackTrace) => _placeholder(),
      );
    }
    return _placeholder();
  }

  Widget _placeholder() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CupertinoColors.systemGrey.withValues(alpha: 0.25),
            CupertinoColors.systemGrey2.withValues(alpha: 0.45),
          ],
        ),
      ),
      child: const Center(
        child: Icon(
          CupertinoIcons.film,
          size: 64,
          color: CupertinoColors.systemGrey3,
        ),
      ),
    );
  }
}

class _CardLayer {
  const _CardLayer({required this.depth, required this.widget});

  final double depth;
  final Widget widget;
}
