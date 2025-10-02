import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
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
  static const _initialPage = 0;
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

      final currentPage = _controller.page?.round() ?? 0;
      final nextPage = (currentPage + 1) % widget.movies.length;

      _controller.animateToPage(
        nextPage,
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
                itemCount: widget.movies.length,
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

                    // Show 3-4 movies with smooth gradual transitions
                    for (var i = -2; i <= 2; i++) {
                      final index = page.floor() + i;
                      if (index < 0 || index >= widget.movies.length) continue;

                      final movie = widget.movies[index];
                      final distance = i - pageOffset;
                      final depth = distance.abs();
                      final clampedDepth = depth.clamp(0.0, 2.0);
                      final isActive = depth < 0.35;

                      // Horizontal spacing without rotation
                      final translateX = distance * viewportWidth * 0.15;
                      final translateY = 0.0;
                      final scale = lerpDouble(1, 0.75, (clampedDepth / 2.0))!;
                      final tilt = 0.0; // No rotation
                      final opacity = lerpDouble(1, 0.7, (clampedDepth / 2.0))!;

                      layers.add(
                        _CardLayer(
                          depth: depth,
                          movie: movie,
                          isActive: isActive,
                          widget: IgnorePointer(
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
                                      alignment: Alignment.center,
                                      child: Opacity(
                                        opacity: opacity,
                                        child: _MovieCard(
                                          key: ValueKey('${movie.id}_$i'),
                                          movie: movie,
                                          dimmed: !isActive,
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

                    final activeLayer = layers.isNotEmpty
                        ? layers.firstWhere(
                            (layer) => layer.isActive,
                            orElse: () => layers.first,
                          )
                        : layers.first;

                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        ...layers.map((layer) => layer.widget),
                        Positioned.fill(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () =>
                                widget.onMovieTap?.call(activeLayer.movie),
                          ),
                        ),
                      ],
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
      return 0.0;
    }
    final page = _controller.page;
    if (page == null) {
      return 0.0;
    }
    return page;
  }
}

class _MovieCard extends StatelessWidget {
  final Movie movie;
  final bool dimmed;

  const _MovieCard({super.key, required this.movie, required this.dimmed});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        alpha: dimmed ? 0.4 : 0.12,
                      ),
                      CupertinoColors.black.withValues(
                        alpha: dimmed ? 0.7 : 0.6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 16,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster() {
    if (movie.posterImage?.isNotEmpty == true) {
      return CachedNetworkImage(
        imageUrl: movie.posterImage!,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return Container(
            color: CupertinoColors.black,
            child: const Center(
              child: CupertinoActivityIndicator(
                radius: 16,
                color: CupertinoColors.white,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) => _placeholder(),
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
  const _CardLayer({
    required this.depth,
    required this.movie,
    required this.isActive,
    required this.widget,
  });

  final double depth;
  final Movie movie;
  final bool isActive;
  final Widget widget;
}
