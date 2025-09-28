import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
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
                                onPressed: () {
                                  // TODO: Handle search action
                                },
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
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                          padding: const EdgeInsets.only(bottom: 16),
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
                    child: Container(
                      color: CupertinoColors.systemBackground.resolveFrom(
                        context,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                        child: const SizedBox.shrink(),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
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
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.65,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return MovieCard(movie: state.movies[index]);
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
    switch (state.status) {
      case MoviesStatus.initial:
      case MoviesStatus.loading:
        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return ShadCard(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: ShadTheme.of(
                      context,
                    ).colorScheme.muted.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ShadTheme.of(
                              context,
                            ).colorScheme.muted.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Container(
                                  width: double.infinity,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: ShadTheme.of(
                                      context,
                                    ).colorScheme.muted.withValues(alpha: 0.4),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Flexible(
                                child: Container(
                                  width: double.infinity * 0.6,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: ShadTheme.of(
                                      context,
                                    ).colorScheme.muted.withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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
