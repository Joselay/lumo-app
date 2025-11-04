// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatData _$SeatDataFromJson(Map<String, dynamic> json) => SeatData(
  seatId: json['seat_id'] as String,
  seatType: json['seat_type'] as String,
  priceMultiplier: (json['price_multiplier'] as num).toDouble(),
  isAvailable: json['is_available'] as bool,
  isBlocked: json['is_blocked'] as bool,
);

Map<String, dynamic> _$SeatDataToJson(SeatData instance) => <String, dynamic>{
  'seat_id': instance.seatId,
  'seat_type': instance.seatType,
  'price_multiplier': instance.priceMultiplier,
  'is_available': instance.isAvailable,
  'is_blocked': instance.isBlocked,
};

SeatRow _$SeatRowFromJson(Map<String, dynamic> json) => SeatRow(
  row: json['row'] as String,
  seats: (json['seats'] as List<dynamic>)
      .map((e) => SeatData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SeatRowToJson(SeatRow instance) => <String, dynamic>{
  'row': instance.row,
  'seats': instance.seats,
};

SeatMapResponse _$SeatMapResponseFromJson(Map<String, dynamic> json) =>
    SeatMapResponse(
      id: json['id'] as String,
      movieTitle: json['movie_title'] as String?,
      theaterName: json['theater_name'] as String?,
      datetime: json['datetime'] as String,
      screenNumber: (json['screen_number'] as num).toInt(),
      ticketPrice: json['ticket_price'] as String,
      totalSeats: (json['total_seats'] as num).toInt(),
      availableSeats: (json['available_seats'] as num).toInt(),
      hasSeatSelection: json['has_seat_selection'] as bool,
      seatMap: (json['seat_map'] as List<dynamic>)
          .map((e) => SeatRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeatMapResponseToJson(SeatMapResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'movie_title': instance.movieTitle,
      'theater_name': instance.theaterName,
      'datetime': instance.datetime,
      'screen_number': instance.screenNumber,
      'ticket_price': instance.ticketPrice,
      'total_seats': instance.totalSeats,
      'available_seats': instance.availableSeats,
      'has_seat_selection': instance.hasSeatSelection,
      'seat_map': instance.seatMap,
    };

SeatReservationData _$SeatReservationDataFromJson(Map<String, dynamic> json) =>
    SeatReservationData(
      id: json['id'] as String,
      seatIdentifier: json['seat_identifier'] as String,
      seatType: json['seat_type'] as String,
      status: json['status'] as String,
      expiresAt: json['expires_at'] as String?,
      price: json['price'] as String,
    );

Map<String, dynamic> _$SeatReservationDataToJson(
  SeatReservationData instance,
) => <String, dynamic>{
  'id': instance.id,
  'seat_identifier': instance.seatIdentifier,
  'seat_type': instance.seatType,
  'status': instance.status,
  'expires_at': instance.expiresAt,
  'price': instance.price,
};

ReserveSeatsRequest _$ReserveSeatsRequestFromJson(Map<String, dynamic> json) =>
    ReserveSeatsRequest(
      seatIds: (json['seat_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      expiryMinutes: (json['expiry_minutes'] as num?)?.toInt() ?? 15,
    );

Map<String, dynamic> _$ReserveSeatsRequestToJson(
  ReserveSeatsRequest instance,
) => <String, dynamic>{
  'seat_ids': instance.seatIds,
  'expiry_minutes': instance.expiryMinutes,
};

ReserveSeatsResponse _$ReserveSeatsResponseFromJson(
  Map<String, dynamic> json,
) => ReserveSeatsResponse(
  message: json['message'] as String,
  reservations: (json['reservations'] as List<dynamic>)
      .map((e) => SeatReservationData.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPrice: json['total_price'] as String,
  expiresAt: json['expires_at'] as String?,
);

Map<String, dynamic> _$ReserveSeatsResponseToJson(
  ReserveSeatsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'reservations': instance.reservations,
  'total_price': instance.totalPrice,
  'expires_at': instance.expiresAt,
};

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
  id: json['id'] as String,
  showtime: json['showtime'] as String,
  customer: json['customer'] as String,
  seatNumbers: (json['seat_numbers'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  totalAmount: (json['total_amount'] as num).toDouble(),
  discountAmount: (json['discount_amount'] as num?)?.toDouble(),
  loyaltyPointsUsed: (json['loyalty_points_used'] as num?)?.toInt(),
  status: json['status'] as String,
  bookingReference: json['booking_reference'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
  'id': instance.id,
  'showtime': instance.showtime,
  'customer': instance.customer,
  'seat_numbers': instance.seatNumbers,
  'total_amount': instance.totalAmount,
  'discount_amount': instance.discountAmount,
  'loyalty_points_used': instance.loyaltyPointsUsed,
  'status': instance.status,
  'booking_reference': instance.bookingReference,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
