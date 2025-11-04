import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/booking.dart';

part 'seat_selection_state.freezed.dart';

enum SeatSelectionStatus {
  initial,
  loading,
  loaded,
  reserving,
  reserved,
  failure,
}

@freezed
abstract class SeatSelectionState with _$SeatSelectionState {
  const factory SeatSelectionState({
    @Default(SeatSelectionStatus.initial) SeatSelectionStatus status,
    SeatMap? seatMap,
    @Default([]) List<Seat> selectedSeats,
    @Default(0.0) double baseTicketPrice,
    @Default(0.0) double totalPrice,
    ReservationResult? reservationResult,
    String? errorMessage,
    DateTime? errorTimestamp,
    String? showtimeId,
  }) = _SeatSelectionState;

  const SeatSelectionState._();

  /// Get list of selected seat IDs
  List<String> get selectedSeatIds =>
      selectedSeats.map((seat) => seat.seatId).toList();

  /// Check if a seat is selected
  bool isSeatSelected(String seatId) =>
      selectedSeats.any((seat) => seat.seatId == seatId);

  /// Get count of selected seats
  int get selectedCount => selectedSeats.length;

  /// Check if any seats are selected
  bool get hasSelectedSeats => selectedSeats.isNotEmpty;
}
