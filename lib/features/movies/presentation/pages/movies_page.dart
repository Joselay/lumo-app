import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../core/data/api_client.dart';
import '../../data/datasources/movies_api.dart';
import '../../data/repositories/movies_repository.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import '../viewmodels/movies_bloc.dart';
import '../viewmodels/movies_event.dart';
import '../viewmodels/movies_state.dart';
import '../widgets/movie_card.dart';
import '../widgets/genre_filter_chips.dart';
import '../widgets/movie_spotlight_carousel.dart';
import '../widgets/shimmer_loading.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(
        getMoviesUseCase: GetMoviesUseCase(
          MoviesRepository(MoviesApi(ApiClient.instance)),
        ),
        getGenresUseCase: GetGenresUseCase(
          MoviesRepository(MoviesApi(ApiClient.instance)),
        ),
      ),
      child: const _MoviesView(),
    );
  }
}

class _MoviesView extends StatefulWidget {
  const _MoviesView();

  @override
  State<_MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<_MoviesView> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesBloc>().add(const MoviesEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state.status == MoviesStatus.loaded &&
                state.movies.isNotEmpty) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  CupertinoSliverRefreshControl(
                    onRefresh: () async {
                      context.read<MoviesBloc>().add(
                        const MoviesEvent.refreshMovies(),
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            left: 16,
                            right: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Popular now',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: CupertinoColors.white,
                                ),
                              ),
                              ShadButton.ghost(
                                onPressed: () =>
                                    context.pushNamed('movies-search'),
                                child: const Icon(
                                  lucide.LucideIcons.search,
                                  color: CupertinoColors.white,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: GenreFilterChips(
                            genres: state.genres,
                            selectedGenreId: state.selectedGenreId,
                            onGenreSelected: (genreId) {
                              if (genreId == null) {
                                context.read<MoviesBloc>().add(
                                  const MoviesEvent.clearFilter(),
                                );
                              } else {
                                context.read<MoviesBloc>().add(
                                  MoviesEvent.filterByGenre(genreId),
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: MovieSpotlightCarousel(
                            movies: state.movies,
                            onMovieTap: (movie) {
                              // TODO: Navigate to movie details
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Text(
                        state.selectedGenreId != null
                            ? 'Filtered Movies (${state.movies.length})'
                            : state.searchQuery?.isNotEmpty == true
                            ? 'Search Results (${state.movies.length})'
                            : 'All Movies (${state.movies.length})',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: MovieCard(movie: state.movies[index]),
                        );
                      }, childCount: state.movies.length),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Container(
                    color: CupertinoColors.systemBackground.resolveFrom(
                      context,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state.genres.isNotEmpty) ...[
                            Text(
                              'Browse by Genre',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.label.resolveFrom(
                                  context,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            GenreFilterChips(
                              genres: state.genres,
                              selectedGenreId: state.selectedGenreId,
                              onGenreSelected: (genreId) {
                                if (genreId == null) {
                                  context.read<MoviesBloc>().add(
                                    const MoviesEvent.clearFilter(),
                                  );
                                } else {
                                  context.read<MoviesBloc>().add(
                                    MoviesEvent.filterByGenre(genreId),
                                  );
                                }
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: _buildMoviesContent(state)),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildMoviesContent(MoviesState state) {
    final isLoading =
        state.status == MoviesStatus.initial ||
        state.status == MoviesStatus.loading;

    switch (state.status) {
      case MoviesStatus.initial:
      case MoviesStatus.loading:
        return Shimmer(
          linearGradient: const LinearGradient(
            colors: [Color(0xFF1A1A1A), Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
            stops: [0.1, 0.3, 0.4],
            begin: Alignment(-1.0, -0.3),
            end: Alignment(1.0, 0.3),
            tileMode: TileMode.clamp,
          ),
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 16,
                        right: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ShimmerLoading(
                            isLoading: isLoading,
                            child: Container(
                              width: 140,
                              height: 28,
                              decoration: BoxDecoration(
                                color: CupertinoColors.black,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                          ShimmerLoading(
                            isLoading: isLoading,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: CupertinoColors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ShimmerLoading(
                                isLoading: isLoading,
                                child: Container(
                                  width: 80,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.black,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: SizedBox(
                        height: 320,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: ShimmerLoading(
                                isLoading: isLoading,
                                child: Container(
                                  width: 280,
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.black,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: ShimmerLoading(
                    isLoading: isLoading,
                    child: Container(
                      width: 180,
                      height: 24,
                      decoration: BoxDecoration(
                        color: CupertinoColors.black,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ShimmerLoading(
                        isLoading: isLoading,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: CupertinoColors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: double.infinity,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: CupertinoColors.black,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        width: 60,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: CupertinoColors.black,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: CupertinoColors.black,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Container(
                                              width: double.infinity * 0.8,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: CupertinoColors.black,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, childCount: 6),
                ),
              ),
            ],
          ),
        );

      case MoviesStatus.error:
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ShadCard(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShadAlert.destructive(
                      icon: const Icon(lucide.LucideIcons.alertCircle),
                      title: const Text('Error loading movies'),
                      description: Text(
                        state.errorMessage ?? 'Unknown error occurred',
                      ),
                    ),
                    const SizedBox(height: 24),
                    ShadButton(
                      onPressed: () {
                        context.read<MoviesBloc>().add(
                          const MoviesEvent.started(),
                        );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

      case MoviesStatus.loaded:
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ShadCard(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      lucide.LucideIcons.film,
                      size: 64,
                      color: ShadTheme.of(context).colorScheme.mutedForeground,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No movies found',
                      style: ShadTheme.of(context).textTheme.h3,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.searchQuery?.isNotEmpty == true
                          ? 'Try adjusting your search or filters'
                          : 'Check back later for new movies',
                      style: ShadTheme.of(context).textTheme.muted,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    }
  }
}
