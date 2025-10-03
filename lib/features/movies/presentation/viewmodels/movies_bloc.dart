import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';
import '../../domain/usecases/get_favorite_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;
  final GetGenresUseCase getGenresUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final GetFavoriteMoviesUseCase getFavoriteMoviesUseCase;

  List<Movie> _allMovies = [];

  MoviesBloc({
    required this.getMoviesUseCase,
    required this.getGenresUseCase,
    required this.toggleFavoriteUseCase,
    required this.getFavoriteMoviesUseCase,
  }) : super(const MoviesState()) {
    on<MoviesStarted>(_onMoviesStarted);
    on<LoadMovies>(_onLoadMovies);
    on<LoadGenres>(_onLoadGenres);
    on<SearchMovies>(_onSearchMovies);
    on<FilterByGenre>(_onFilterByGenre);
    on<ClearFilter>(_onClearFilter);
    on<RefreshMovies>(_onRefreshMovies);
    on<ToggleFavorite>(_onToggleFavorite);
    on<LoadFavorites>(_onLoadFavorites);
  }

  Future<void> _onMoviesStarted(
    MoviesStarted event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(status: MoviesStatus.loading));

    try {
      final genresFuture = getGenresUseCase();
      final moviesFuture = getMoviesUseCase(
        filter: const MoviesFilter(isActive: true),
      );

      final genres = await genresFuture;
      final movies = await moviesFuture;

      _allMovies = movies;

      emit(
        state.copyWith(
          status: MoviesStatus.loaded,
          movies: movies,
          genres: genres,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MoviesStatus.error,
          errorMessage: e.toString(),
          errorTimestamp: DateTime.now(),
        ),
      );
    }
  }

  Future<void> _onLoadMovies(
    LoadMovies event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(status: MoviesStatus.loading));

    try {
      final movies = await getMoviesUseCase(filter: event.filter);
      emit(
        state.copyWith(
          status: MoviesStatus.loaded,
          movies: movies,
          currentFilter: event.filter,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MoviesStatus.error,
          errorMessage: e.toString(),
          errorTimestamp: DateTime.now(),
        ),
      );
    }
  }

  Future<void> _onLoadGenres(
    LoadGenres event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      final genres = await getGenresUseCase();
      emit(state.copyWith(genres: genres));
    } catch (e) {
      emit(
        state.copyWith(
          status: MoviesStatus.error,
          errorMessage: e.toString(),
          errorTimestamp: DateTime.now(),
        ),
      );
    }
  }

  Future<void> _onSearchMovies(
    SearchMovies event,
    Emitter<MoviesState> emit,
  ) async {
    final searchQuery = event.query.toLowerCase();

    List<Movie> filtered = _allMovies;

    if (state.selectedGenreId != null) {
      filtered = filtered
          .where(
            (movie) =>
                movie.genres.any((genre) => genre.id == state.selectedGenreId),
          )
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (movie) =>
                movie.title.toLowerCase().contains(searchQuery) ||
                movie.description.toLowerCase().contains(searchQuery),
          )
          .toList();
    }

    emit(
      state.copyWith(
        status: MoviesStatus.loaded,
        movies: filtered,
        searchQuery: event.query.isEmpty ? null : event.query,
      ),
    );
  }

  Future<void> _onFilterByGenre(
    FilterByGenre event,
    Emitter<MoviesState> emit,
  ) async {
    List<Movie> filtered = _allMovies;

    filtered = filtered
        .where(
          (movie) => movie.genres.any((genre) => genre.id == event.genreId),
        )
        .toList();

    if (state.searchQuery != null && state.searchQuery!.isNotEmpty) {
      final searchQuery = state.searchQuery!.toLowerCase();
      filtered = filtered
          .where(
            (movie) =>
                movie.title.toLowerCase().contains(searchQuery) ||
                movie.description.toLowerCase().contains(searchQuery),
          )
          .toList();
    }

    emit(
      state.copyWith(
        status: MoviesStatus.loaded,
        movies: filtered,
        selectedGenreId: event.genreId,
      ),
    );
  }

  Future<void> _onClearFilter(
    ClearFilter event,
    Emitter<MoviesState> emit,
  ) async {
    emit(
      state.copyWith(
        status: MoviesStatus.loaded,
        movies: _allMovies,
        searchQuery: null,
        selectedGenreId: null,
      ),
    );
  }

  Future<void> _onRefreshMovies(
    RefreshMovies event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true));

    try {
      final movies = await getMoviesUseCase(
        filter: const MoviesFilter(isActive: true),
      );

      _allMovies = movies;

      List<Movie> filtered = movies;

      if (state.selectedGenreId != null) {
        filtered = filtered
            .where(
              (movie) => movie.genres.any(
                (genre) => genre.id == state.selectedGenreId,
              ),
            )
            .toList();
      }

      if (state.searchQuery != null && state.searchQuery!.isNotEmpty) {
        final searchQuery = state.searchQuery!.toLowerCase();
        filtered = filtered
            .where(
              (movie) =>
                  movie.title.toLowerCase().contains(searchQuery) ||
                  movie.description.toLowerCase().contains(searchQuery),
            )
            .toList();
      }

      emit(
        state.copyWith(
          status: MoviesStatus.loaded,
          movies: filtered,
          isRefreshing: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MoviesStatus.error,
          errorMessage: e.toString(),
          errorTimestamp: DateTime.now(),
          isRefreshing: false,
        ),
      );
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      final newFavoritedState = await toggleFavoriteUseCase(
        event.movieId,
        event.currentlyFavorited,
      );

      final updatedMovies = state.movies.map((movie) {
        if (movie.id == event.movieId) {
          return movie.copyWith(isFavorited: newFavoritedState);
        }
        return movie;
      }).toList();

      _allMovies = _allMovies.map((movie) {
        if (movie.id == event.movieId) {
          return movie.copyWith(isFavorited: newFavoritedState);
        }
        return movie;
      }).toList();

      List<Movie> updatedFavorites = List.from(state.favoriteMovies);
      if (newFavoritedState) {
        final movieToAdd = updatedMovies.firstWhere(
          (m) => m.id == event.movieId,
          orElse: () => _allMovies.firstWhere((m) => m.id == event.movieId),
        );
        if (!updatedFavorites.any((m) => m.id == event.movieId)) {
          updatedFavorites.insert(0, movieToAdd);
        }
      } else {
        updatedFavorites.removeWhere((m) => m.id == event.movieId);
      }

      emit(
        state.copyWith(movies: updatedMovies, favoriteMovies: updatedFavorites),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to toggle favorite: ${e.toString()}',
          errorTimestamp: DateTime.now(),
        ),
      );
    }
  }

  Future<void> _onLoadFavorites(
    LoadFavorites event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(isFavoritesLoading: true));

    try {
      final favorites = await getFavoriteMoviesUseCase();

      emit(
        state.copyWith(favoriteMovies: favorites, isFavoritesLoading: false),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to load favorites: ${e.toString()}',
          errorTimestamp: DateTime.now(),
          isFavoritesLoading: false,
        ),
      );
    }
  }
}
