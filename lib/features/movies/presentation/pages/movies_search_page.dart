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
import '../widgets/movie_search_bar.dart';

class MoviesSearchPage extends StatelessWidget {
  const MoviesSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoviesBloc(
        getMoviesUseCase: GetMoviesUseCase(
          MoviesRepository(MoviesApi(ApiClient.instance)),
        ),
        getGenresUseCase: GetGenresUseCase(
          MoviesRepository(MoviesApi(ApiClient.instance)),
        ),
      )..add(const MoviesEvent.started()),
      child: const _MoviesSearchView(),
    );
  }
}

class _MoviesSearchView extends StatefulWidget {
  const _MoviesSearchView();

  @override
  State<_MoviesSearchView> createState() => _MoviesSearchViewState();
}

class _MoviesSearchViewState extends State<_MoviesSearchView> {
  void _onSearch(String query) {
    context.read<MoviesBloc>().add(MoviesEvent.searchMovies(query.trim()));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Search'),
        leading: CupertinoNavigationBarBackButton(
          color: CupertinoColors.activeBlue.resolveFrom(context),
          onPressed: () => context.pop(),
        ),
        backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
        border: null,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: MovieSearchBar(onSearch: _onSearch),
            ),
            Expanded(
              child: BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  switch (state.status) {
                    case MoviesStatus.initial:
                    case MoviesStatus.loading:
                      return const Center(child: CupertinoActivityIndicator());
                    case MoviesStatus.error:
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: ShadCard(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ShadAlert.destructive(
                                    icon: const Icon(
                                      lucide.LucideIcons.alertCircle,
                                    ),
                                    title: const Text('Search failed'),
                                    description: Text(
                                      state.errorMessage ??
                                          'Unknown error occurred',
                                    ),
                                  ),
                                  const SizedBox(height: 20),
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
                      if (state.movies.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  lucide.LucideIcons.film,
                                  size: 48,
                                  color: colorScheme.mutedForeground,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'No results',
                                  style: ShadTheme.of(context).textTheme.h4,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Try another title or adjust your spelling.',
                                  style: ShadTheme.of(context).textTheme.muted,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                        itemCount: state.movies.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final movie = state.movies[index];
                          return MovieCard(movie: movie);
                        },
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
