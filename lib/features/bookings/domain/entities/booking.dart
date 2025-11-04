import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';

/// Enum for seat types
enum SeatType {
  standard,
  premium,
  accessible,
  couple,
  blocked,
}

/// Extension to convert string to SeatType
extension SeatTypeExtension on String {
  SeatType toSeatType() {
    switch (toLowerCase()) {
      case 'standard':
        return SeatType.standard;
      case 'premium':
        return SeatType.premium;
      case 'accessible':
        return SeatType.accessible;
      case 'couple':
        return SeatType.couple;
      case 'blocked':
        return SeatType.blocked;
      default:
        return SeatType.standard;
    }
  }
}

/// Represents a seat in the theater
@freezed
abstract class Seat with _$Seat {
  const factory Seat({
    required String seatId,
    required SeatType seatType,
    required double priceMultiplier,
    required bool isAvailable,
    required bool isBlocked,
    @Default(false) bool isSelected,
  }) = _Seat;
}

/// Represents a row of seats
@freezed
abstract class SeatRow with _$SeatRow {
  const factory SeatRow({
    required String row,
    required List<Seat> seats,
  }) = _SeatRow;
}

/// Represents the complete seat map for a showtime
@freezed
abstract class SeatMap with _$SeatMap {
  const factory SeatMap({
    required String id,
    String? movieTitle,
    String? theaterName,
    required String datetime,
    required int screenNumber,
    required double ticketPrice,
    required int totalSeats,
    required int availableSeats,
    required bool hasSeatSelection,
    required List<SeatRow> seatMap,
  }) = _SeatMap;
}

/// Represents a seat reservation
@freezed
abstract class SeatReservation with _$SeatReservation {
  const factory SeatReservation({
    required String id,
    required String seatIdentifier,
    required String seatType,
    required String status,
    DateTime? expiresAt,
    required double price,
  }) = _SeatReservation;
}

/// Result from reserving seats
@freezed
abstract class ReservationResult with _$ReservationResult {
  const factory ReservationResult({
    required String message,
    required List<SeatReservation> reservations,
    required double totalAmount,
    DateTime? expiresAt,
  }) = _ReservationResult;
}

/// Enum for booking status
enum BookingStatus {
  pending,
  confirmed,
  cancelled,
  refunded,
}

/// Extension to convert string to BookingStatus
extension BookingStatusExtension on String {
  BookingStatus toBookingStatus() {
    switch (toLowerCase()) {
      case 'pending':
        return BookingStatus.pending;
      case 'confirmed':
        return BookingStatus.confirmed;
      case 'cancelled':
        return BookingStatus.cancelled;
      case 'refunded':
        return BookingStatus.refunded;
      default:
        return BookingStatus.pending;
    }
  }
}

/// Represents a booking
@freezed
abstract class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String showtimeId,
    required String customerId,
    required List<String> seatNumbers,
    required double totalAmount,
    double? discountAmount,
    int? loyaltyPointsUsed,
    required BookingStatus status,
    required String bookingReference,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Booking;
}
