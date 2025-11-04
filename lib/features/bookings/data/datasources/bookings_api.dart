import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/booking_models.dart';

part 'bookings_api.g.dart';

@RestApi()
abstract class BookingsApi {
  factory BookingsApi(Dio dio) = _BookingsApi;

  /// Get seat map for a specific showtime
  @GET('/movies/showtimes/{showtimeId}/seat-map/')
  Future<SeatMapResponse> getSeatMap(@Path('showtimeId') String showtimeId);

  /// Reserve seats for a showtime (creates temporary reservation)
  @POST('/movies/showtimes/{showtimeId}/reserve-seats/')
  Future<ReserveSeatsResponse> reserveSeats(
    @Path('showtimeId') String showtimeId,
    @Body() ReserveSeatsRequest request,
  );

  /// Create a booking (confirms the reservation)
  @POST('/bookings/')
  Future<Booking> createBooking(@Body() Map<String, dynamic> bookingData);

  /// Get list of customer bookings
  @GET('/bookings/')
  Future<List<Booking>> getBookings();

  /// Get booking details
  @GET('/bookings/{id}/')
  Future<Booking> getBookingById(@Path('id') String id);

  /// Cancel a booking
  @POST('/bookings/{id}/cancel/')
  Future<Booking> cancelBooking(@Path('id') String id);
}
