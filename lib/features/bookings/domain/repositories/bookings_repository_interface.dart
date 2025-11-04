import '../entities/booking.dart';

/// Interface for bookings repository
abstract class BookingsRepositoryInterface {
  /// Get seat map for a specific showtime
  Future<SeatMap> getSeatMap(String showtimeId);

  /// Reserve seats for a showtime (temporary reservation)
  Future<ReservationResult> reserveSeats(
    String showtimeId,
    List<String> seatIds,
  );

  /// Create a booking (confirms the reservation)
  Future<Booking> createBooking({
    required String showtimeId,
    required List<String> seatIds,
    int? loyaltyPointsUsed,
  });

  /// Get list of customer bookings
  Future<List<Booking>> getBookings();

  /// Get booking details by ID
  Future<Booking> getBookingById(String id);

  /// Cancel a booking
  Future<Booking> cancelBooking(String id);
}
