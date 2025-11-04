// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concession_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConcessionModel _$ConcessionModelFromJson(Map<String, dynamic> json) =>
    _ConcessionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      concessionType: json['concession_type'] as String,
      price: _priceFromJson(json['price']),
      imageUrl: json['image_url'] as String?,
      isAvailable: json['is_available'] as bool,
      isCombo: json['is_combo'] as bool,
      comboItems: json['combo_items'] as String?,
    );

Map<String, dynamic> _$ConcessionModelToJson(_ConcessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'concession_type': instance.concessionType,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'is_available': instance.isAvailable,
      'is_combo': instance.isCombo,
      'combo_items': instance.comboItems,
    };

_BookingConcessionInputModel _$BookingConcessionInputModelFromJson(
  Map<String, dynamic> json,
) => _BookingConcessionInputModel(
  concessionId: json['concession_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$BookingConcessionInputModelToJson(
  _BookingConcessionInputModel instance,
) => <String, dynamic>{
  'concession_id': instance.concessionId,
  'quantity': instance.quantity,
};
