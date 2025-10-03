import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_movie_showtimes_usecase.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieShowtimesUseCase getMovieShowtimesUseCase;

  MovieDetailsBloc({
    required this.getMovieShowtimesUseCase,
  }) : super(const MovieDetailsState()) {
    on<MovieDetailsStarted>(_onStarted);
    on<MovieDetailsRefreshShowtimes>(_onRefreshShowtimes);
  }

  Future<void> _onStarted(
    MovieDetailsStarted event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(state.copyWith(
      status: MovieDetailsStatus.loading,
      movieId: event.movieId,
    ));

    try {
      final showtimes = await getMovieShowtimesUseCase.execute(event.movieId);

      emit(state.copyWith(
        status: MovieDetailsStatus.loaded,
        showtimes: showtimes,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MovieDetailsStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshShowtimes(
    MovieDetailsRefreshShowtimes event,
    Emitter<MovieDetailsState> emit,
  ) async {
    if (state.movieId == null) return;

    try {
      final showtimes = await getMovieShowtimesUseCase.execute(state.movieId!);

      emit(state.copyWith(
        status: MovieDetailsStatus.loaded,
        showtimes: showtimes,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MovieDetailsStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
