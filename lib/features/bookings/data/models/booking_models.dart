import 'package:json_annotation/json_annotation.dart';

part 'booking_models.g.dart';

/// Represents a seat in the seat map
@JsonSerializable()
class SeatData {
  @JsonKey(name: 'seat_id')
  final String seatId;
  @JsonKey(name: 'seat_type')
  final String seatType;
  @JsonKey(name: 'price_multiplier')
  final double priceMultiplier;
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;

  const SeatData({
    required this.seatId,
    required this.seatType,
    required this.priceMultiplier,
    required this.isAvailable,
    required this.isBlocked,
  });

  factory SeatData.fromJson(Map<String, dynamic> json) =>
      _$SeatDataFromJson(json);

  Map<String, dynamic> toJson() => _$SeatDataToJson(this);
}

/// Represents a row of seats
@JsonSerializable()
class SeatRow {
  final String row;
  final List<SeatData> seats;

  const SeatRow({
    required this.row,
    required this.seats,
  });

  factory SeatRow.fromJson(Map<String, dynamic> json) =>
      _$SeatRowFromJson(json);

  Map<String, dynamic> toJson() => _$SeatRowToJson(this);
}

/// Response from the seat map API
@JsonSerializable()
class SeatMapResponse {
  final String id;
  @JsonKey(name: 'movie_title')
  final String? movieTitle;
  @JsonKey(name: 'theater_name')
  final String? theaterName;
  final String datetime;
  @JsonKey(name: 'screen_number')
  final int screenNumber;
  @JsonKey(name: 'ticket_price')
  final String ticketPrice;
  @JsonKey(name: 'total_seats')
  final int totalSeats;
  @JsonKey(name: 'available_seats')
  final int availableSeats;
  @JsonKey(name: 'has_seat_selection')
  final bool hasSeatSelection;
  @JsonKey(name: 'seat_map')
  final List<SeatRow> seatMap;

  const SeatMapResponse({
    required this.id,
    this.movieTitle,
    this.theaterName,
    required this.datetime,
    required this.screenNumber,
    required this.ticketPrice,
    required this.totalSeats,
    required this.availableSeats,
    required this.hasSeatSelection,
    required this.seatMap,
  });

  factory SeatMapResponse.fromJson(Map<String, dynamic> json) =>
      _$SeatMapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeatMapResponseToJson(this);

  /// Get base ticket price as double
  double get baseTicketPrice => double.tryParse(ticketPrice) ?? 0.0;
}

/// Represents a seat reservation
@JsonSerializable()
class SeatReservationData {
  final String id;
  @JsonKey(name: 'seat_identifier')
  final String seatIdentifier;
  @JsonKey(name: 'seat_type')
  final String seatType;
  final String status;
  @JsonKey(name: 'expires_at')
  final String? expiresAt;
  final String price;

  const SeatReservationData({
    required this.id,
    required this.seatIdentifier,
    required this.seatType,
    required this.status,
    this.expiresAt,
    required this.price,
  });

  factory SeatReservationData.fromJson(Map<String, dynamic> json) =>
      _$SeatReservationDataFromJson(json);

  Map<String, dynamic> toJson() => _$SeatReservationDataToJson(this);
}

/// Request to reserve seats
@JsonSerializable()
class ReserveSeatsRequest {
  @JsonKey(name: 'seat_ids')
  final List<String> seatIds;
  @JsonKey(name: 'expiry_minutes')
  final int expiryMinutes;

  const ReserveSeatsRequest({
    required this.seatIds,
    this.expiryMinutes = 15,
  });

  factory ReserveSeatsRequest.fromJson(Map<String, dynamic> json) =>
      _$ReserveSeatsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReserveSeatsRequestToJson(this);
}

/// Response from reserve seats API
@JsonSerializable()
class ReserveSeatsResponse {
  final String message;
  final List<SeatReservationData> reservations;
  @JsonKey(name: 'total_price')
  final String totalPrice;
  @JsonKey(name: 'expires_at')
  final String? expiresAt;

  const ReserveSeatsResponse({
    required this.message,
    required this.reservations,
    required this.totalPrice,
    this.expiresAt,
  });

  factory ReserveSeatsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReserveSeatsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReserveSeatsResponseToJson(this);

  /// Get total price as double
  double get totalAmount => double.tryParse(totalPrice) ?? 0.0;
}

// Helper functions to parse decimal strings from Django backend
double _parseDecimal(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

double? _parseDecimalNullable(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

/// Represents a booking
@JsonSerializable()
class Booking {
  final String id;
  // Backend returns showtime as a nested object or string ID depending on endpoint
  @JsonKey(name: 'showtime')
  final dynamic showtime;
  // Backend returns customer as a nested object or string ID depending on endpoint
  @JsonKey(name: 'customer')
  final dynamic customer;
  @JsonKey(name: 'seat_numbers')
  final List<String> seatNumbers;
  @JsonKey(name: 'total_amount', fromJson: _parseDecimal)
  final double totalAmount;
  @JsonKey(name: 'discount_amount', fromJson: _parseDecimalNullable)
  final double? discountAmount;
  @JsonKey(name: 'loyalty_points_used')
  final int? loyaltyPointsUsed;
  @JsonKey(name: 'number_of_seats')
  final int? numberOfSeats;
  @JsonKey(name: 'base_price_per_seat', fromJson: _parseDecimalNullable)
  final double? basePricePerSeat;
  @JsonKey(name: 'concessions_total', fromJson: _parseDecimalNullable)
  final double? concessionsTotal;
  @JsonKey(name: 'concessions')
  final List<dynamic>? concessions;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'can_cancel')
  final bool? canCancel;
  @JsonKey(name: 'special_requests')
  final String? specialRequests;
  final String status;
  @JsonKey(name: 'booking_reference')
  final String bookingReference;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'confirmed_at')
  final String? confirmedAt;
  @JsonKey(name: 'cancelled_at')
  final String? cancelledAt;

  const Booking({
    required this.id,
    required this.showtime,
    required this.customer,
    required this.seatNumbers,
    required this.totalAmount,
    this.discountAmount,
    this.loyaltyPointsUsed,
    this.numberOfSeats,
    this.basePricePerSeat,
    this.concessionsTotal,
    this.concessions,
    this.isActive,
    this.canCancel,
    this.specialRequests,
    required this.status,
    required this.bookingReference,
    required this.createdAt,
    this.updatedAt,
    this.confirmedAt,
    this.cancelledAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);

  bool get isPending => status == 'pending';
  bool get isConfirmed => status == 'confirmed';
  bool get isCancelled => status == 'cancelled';
  bool get isRefunded => status == 'refunded';
}
