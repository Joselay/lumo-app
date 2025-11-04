import '../../domain/entities/booking.dart' as domain;
import '../../domain/repositories/bookings_repository_interface.dart';
import '../datasources/bookings_api.dart';
import '../models/booking_models.dart';

class BookingsRepository implements BookingsRepositoryInterface {
  final BookingsApi api;

  BookingsRepository(this.api);

  @override
  Future<domain.SeatMap> getSeatMap(String showtimeId) async {
    final response = await api.getSeatMap(showtimeId);
    return _mapToDomainSeatMap(response);
  }

  @override
  Future<domain.ReservationResult> reserveSeats(
    String showtimeId,
    List<String> seatIds,
  ) async {
    final request = ReserveSeatsRequest(seatIds: seatIds);
    final response = await api.reserveSeats(showtimeId, request);
    return _mapToDomainReservationResult(response);
  }

  @override
  Future<domain.Booking> createBooking({
    required String showtimeId,
    required List<String> seatIds,
    int? loyaltyPointsUsed,
  }) async {
    final bookingData = <String, dynamic>{
      'showtime': showtimeId,
      'seat_ids': seatIds,
      if (loyaltyPointsUsed != null) 'loyalty_points_used': loyaltyPointsUsed,
    };

    final booking = await api.createBooking(bookingData);
    return _mapToDomainBooking(booking);
  }

  @override
  Future<List<domain.Booking>> getBookings() async {
    final bookings = await api.getBookings();
    return bookings.map(_mapToDomainBooking).toList();
  }

  @override
  Future<domain.Booking> getBookingById(String id) async {
    final booking = await api.getBookingById(id);
    return _mapToDomainBooking(booking);
  }

  @override
  Future<domain.Booking> cancelBooking(String id) async {
    final booking = await api.cancelBooking(id);
    return _mapToDomainBooking(booking);
  }

  // Mapping functions from data models to domain entities

  domain.SeatMap _mapToDomainSeatMap(SeatMapResponse response) {
    return domain.SeatMap(
      id: response.id,
      movieTitle: response.movieTitle,
      theaterName: response.theaterName,
      datetime: response.datetime,
      screenNumber: response.screenNumber,
      ticketPrice: response.baseTicketPrice,
      totalSeats: response.totalSeats,
      availableSeats: response.availableSeats,
      hasSeatSelection: response.hasSeatSelection,
      seatMap: response.seatMap.map(_mapToDomainSeatRow).toList(),
    );
  }

  domain.SeatRow _mapToDomainSeatRow(SeatRow row) {
    return domain.SeatRow(
      row: row.row,
      seats: row.seats.map(_mapToDomainSeat).toList(),
    );
  }

  domain.Seat _mapToDomainSeat(SeatData seat) {
    return domain.Seat(
      seatId: seat.seatId,
      seatType: seat.seatType.toSeatType(),
      priceMultiplier: seat.priceMultiplier,
      isAvailable: seat.isAvailable,
      isBlocked: seat.isBlocked,
      isSelected: false, // Initially not selected
    );
  }

  domain.ReservationResult _mapToDomainReservationResult(
    ReserveSeatsResponse response,
  ) {
    return domain.ReservationResult(
      message: response.message,
      reservations: response.reservations.map(_mapToDomainReservation).toList(),
      totalAmount: response.totalAmount,
      expiresAt: response.expiresAt != null
          ? DateTime.tryParse(response.expiresAt!)
          : null,
    );
  }

  domain.SeatReservation _mapToDomainReservation(
    SeatReservationData reservation,
  ) {
    return domain.SeatReservation(
      id: reservation.id,
      seatIdentifier: reservation.seatIdentifier,
      seatType: reservation.seatType,
      status: reservation.status,
      expiresAt: reservation.expiresAt != null
          ? DateTime.tryParse(reservation.expiresAt!)
          : null,
      price: double.tryParse(reservation.price) ?? 0.0,
    );
  }

  domain.Booking _mapToDomainBooking(Booking booking) {
    return domain.Booking(
      id: booking.id,
      showtimeId: booking.showtime,
      customerId: booking.customer,
      seatNumbers: booking.seatNumbers,
      totalAmount: booking.totalAmount,
      discountAmount: booking.discountAmount,
      loyaltyPointsUsed: booking.loyaltyPointsUsed,
      status: booking.status.toBookingStatus(),
      bookingReference: booking.bookingReference,
      createdAt: DateTime.parse(booking.createdAt),
      updatedAt:
          booking.updatedAt != null ? DateTime.tryParse(booking.updatedAt!) : null,
    );
  }
}
