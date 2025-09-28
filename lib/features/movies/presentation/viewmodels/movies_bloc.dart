import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;
  final GetGenresUseCase getGenresUseCase;

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
    emit(
      state.copyWith(status: MoviesStatus.loading, searchQuery: event.query),
    );

    try {
      final filter = MoviesFilter(
        search: event.query.isEmpty ? null : event.query,
        genre: state.selectedGenreId,
        isActive: true,
      );

      final movies = await getMoviesUseCase(filter: filter);
      emit(
        state.copyWith(
          status: MoviesStatus.loaded,
          movies: movies,
          currentFilter: filter,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: MoviesStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onFilterByGenre(
    FilterByGenre event,
    Emitter<MoviesState> emit,
  ) async {
    emit(
      state.copyWith(
        status: MoviesStatus.loading,
        selectedGenreId: event.genreId,
      ),
    );

    try {
      final filter = MoviesFilter(
        search: state.searchQuery,
        genre: event.genreId,
        isActive: true,
      );

      final movies = await getMoviesUseCase(filter: filter);
      emit(
        state.copyWith(
          status: MoviesStatus.loaded,
          movies: movies,
          currentFilter: filter,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: MoviesStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onClearFilter(
    ClearFilter event,
    Emitter<MoviesState> emit,
  ) async {
    emit(
      state.copyWith(
        status: MoviesStatus.loading,
        searchQuery: null,
        selectedGenreId: null,
      ),
    );

    try {
      final filter = const MoviesFilter(isActive: true);
      final movies = await getMoviesUseCase(filter: filter);
      emit(
        state.copyWith(
          status: MoviesStatus.loaded,
          movies: movies,
          currentFilter: filter,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: MoviesStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onRefreshMovies(
    RefreshMovies event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true));

    try {
      final movies = await getMoviesUseCase(filter: state.currentFilter);
      emit(
        state.copyWith(
          status: MoviesStatus.loaded,
          movies: movies,
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
