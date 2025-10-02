import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;
  final GetGenresUseCase getGenresUseCase;

  List<Movie> _allMovies = [];

  MoviesBloc({required this.getMoviesUseCase, required this.getGenresUseCase})
    : super(const MoviesState()) {
    on<MoviesStarted>(_onMoviesStarted);
    on<LoadMovies>(_onLoadMovies);
    on<LoadGenres>(_onLoadGenres);
    on<SearchMovies>(_onSearchMovies);
    on<FilterByGenre>(_onFilterByGenre);
    on<ClearFilter>(_onClearFilter);
    on<RefreshMovies>(_onRefreshMovies);
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
        state.copyWith(status: MoviesStatus.error, errorMessage: e.toString()),
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
        state.copyWith(status: MoviesStatus.error, errorMessage: e.toString()),
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
        state.copyWith(status: MoviesStatus.error, errorMessage: e.toString()),
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
          isRefreshing: false,
        ),
      );
    }
  }
}
