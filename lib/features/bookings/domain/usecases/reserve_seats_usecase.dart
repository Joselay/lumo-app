import '../entities/booking.dart';
import '../repositories/bookings_repository_interface.dart';

class ReserveSeatsUseCase {
  final BookingsRepositoryInterface repository;

  ReserveSeatsUseCase(this.repository);

  Future<ReservationResult> execute(String showtimeId, List<String> seatIds) {
    return repository.reserveSeats(showtimeId, seatIds);
  }
}
