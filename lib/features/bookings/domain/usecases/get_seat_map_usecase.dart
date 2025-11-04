import '../entities/booking.dart';
import '../repositories/bookings_repository_interface.dart';

class GetSeatMapUseCase {
  final BookingsRepositoryInterface repository;

  GetSeatMapUseCase(this.repository);

  Future<SeatMap> execute(String showtimeId) {
    return repository.getSeatMap(showtimeId);
  }
}
