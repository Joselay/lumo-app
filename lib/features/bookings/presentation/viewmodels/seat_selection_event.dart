import 'package:freezed_annotation/freezed_annotation.dart';

part 'seat_selection_event.freezed.dart';

@freezed
abstract class SeatSelectionEvent with _$SeatSelectionEvent {
  /// Initialize seat selection by loading seat map
  const factory SeatSelectionEvent.started(String showtimeId) =
      SeatSelectionStarted;

  /// Toggle seat selection (select/deselect)
  const factory SeatSelectionEvent.seatToggled(String seatId) =
      SeatSelectionSeatToggled;

  /// Proceed to reserve selected seats
  const factory SeatSelectionEvent.reserveSeats() = SeatSelectionReserveSeats;

  /// Refresh seat map to get updated availability
  const factory SeatSelectionEvent.refreshSeatMap() =
      SeatSelectionRefreshSeatMap;
}
