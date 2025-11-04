import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/booking.dart';
import '../../domain/usecases/get_seat_map_usecase.dart';
import '../../domain/usecases/reserve_seats_usecase.dart';
import 'seat_selection_event.dart';
import 'seat_selection_state.dart';

class SeatSelectionBloc extends Bloc<SeatSelectionEvent, SeatSelectionState> {
  final GetSeatMapUseCase getSeatMapUseCase;
  final ReserveSeatsUseCase reserveSeatsUseCase;

  SeatSelectionBloc({
    required this.getSeatMapUseCase,
    required this.reserveSeatsUseCase,
    required double baseTicketPrice,
  }) : super(SeatSelectionState(baseTicketPrice: baseTicketPrice)) {
    on<SeatSelectionStarted>(_onStarted);
    on<SeatSelectionSeatToggled>(_onSeatToggled);
    on<SeatSelectionReserveSeats>(_onReserveSeats);
    on<SeatSelectionRefreshSeatMap>(_onRefreshSeatMap);
  }

  Future<void> _onStarted(
    SeatSelectionStarted event,
    Emitter<SeatSelectionState> emit,
  ) async {
    emit(state.copyWith(
      status: SeatSelectionStatus.loading,
      showtimeId: event.showtimeId,
    ));

    try {
      final seatMap = await getSeatMapUseCase.execute(event.showtimeId);

      emit(state.copyWith(
        status: SeatSelectionStatus.loaded,
        seatMap: seatMap,
        baseTicketPrice: seatMap.ticketPrice,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: SeatSelectionStatus.failure,
        errorMessage: e.toString(),
        errorTimestamp: DateTime.now(),
      ));
    }
  }

  void _onSeatToggled(
    SeatSelectionSeatToggled event,
    Emitter<SeatSelectionState> emit,
  ) {
    if (state.seatMap == null) return;

    // Find the seat in the seat map by searching through rows
    Seat? foundSeat;
    for (final row in state.seatMap!.seatMap) {
      for (final seat in row.seats) {
        if (seat.seatId == event.seatId) {
          foundSeat = seat;
          break;
        }
      }
      if (foundSeat != null) break;
    }

    if (foundSeat == null) return;

    // Don't allow selecting unavailable or blocked seats
    if (!foundSeat.isAvailable || foundSeat.isBlocked) return;

    // Toggle selection
    final selectedSeats = List<Seat>.from(state.selectedSeats);
    final isCurrentlySelected = selectedSeats.any((s) => s.seatId == event.seatId);

    if (isCurrentlySelected) {
      // Deselect
      selectedSeats.removeWhere((s) => s.seatId == event.seatId);
    } else {
      // Select
      selectedSeats.add(foundSeat.copyWith(isSelected: true));
    }

    // Calculate total price based on base price and seat multipliers
    final totalPrice = selectedSeats.fold<double>(
      0.0,
      (sum, seat) => sum + (state.baseTicketPrice * seat.priceMultiplier),
    );

    emit(state.copyWith(
      selectedSeats: selectedSeats,
      totalPrice: totalPrice,
    ));
  }

  Future<void> _onReserveSeats(
    SeatSelectionReserveSeats event,
    Emitter<SeatSelectionState> emit,
  ) async {
    if (state.selectedSeats.isEmpty || state.showtimeId == null) return;

    emit(state.copyWith(status: SeatSelectionStatus.reserving));

    try {
      final result = await reserveSeatsUseCase.execute(
        state.showtimeId!,
        state.selectedSeatIds,
      );

      emit(state.copyWith(
        status: SeatSelectionStatus.reserved,
        reservationResult: result,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: SeatSelectionStatus.failure,
        errorMessage: e.toString(),
        errorTimestamp: DateTime.now(),
      ));
    }
  }

  Future<void> _onRefreshSeatMap(
    SeatSelectionRefreshSeatMap event,
    Emitter<SeatSelectionState> emit,
  ) async {
    if (state.showtimeId == null) return;

    try {
      final seatMap = await getSeatMapUseCase.execute(state.showtimeId!);

      // Keep current selections but update seat availability
      final updatedSelectedSeats = <Seat>[];
      for (final selectedSeat in state.selectedSeats) {
        // Find the seat in the new seat map
        Seat? updatedSeat;
        for (final row in seatMap.seatMap) {
          for (final seat in row.seats) {
            if (seat.seatId == selectedSeat.seatId) {
              updatedSeat = seat;
              break;
            }
          }
          if (updatedSeat != null) break;
        }

        // Only keep selection if seat is still available
        if (updatedSeat != null &&
            updatedSeat.isAvailable &&
            !updatedSeat.isBlocked) {
          updatedSelectedSeats.add(updatedSeat.copyWith(isSelected: true));
        }
      }

      // Recalculate total price
      final totalPrice = updatedSelectedSeats.fold<double>(
        0.0,
        (sum, seat) => sum + (seatMap.ticketPrice * seat.priceMultiplier),
      );

      emit(state.copyWith(
        status: SeatSelectionStatus.loaded,
        seatMap: seatMap,
        selectedSeats: updatedSelectedSeats,
        totalPrice: totalPrice,
        baseTicketPrice: seatMap.ticketPrice,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: SeatSelectionStatus.failure,
        errorMessage: e.toString(),
        errorTimestamp: DateTime.now(),
      ));
    }
  }
}
