import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/concession.dart';

part 'concession_models.freezed.dart';
part 'concession_models.g.dart';

/// Helper function to convert string or number to double
double _priceFromJson(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.parse(value);
  throw Exception('Invalid price format: $value');
}

/// Data model for Concession
@freezed
abstract class ConcessionModel with _$ConcessionModel {
  const ConcessionModel._();

  const factory ConcessionModel({
    required String id,
    required String name,
    required String description,
    @JsonKey(name: 'concession_type') required String concessionType,
    @JsonKey(fromJson: _priceFromJson) required double price,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_available') required bool isAvailable,
    @JsonKey(name: 'is_combo') required bool isCombo,
    @JsonKey(name: 'combo_items') String? comboItems,
  }) = _ConcessionModel;

  factory ConcessionModel.fromJson(Map<String, dynamic> json) =>
      _$ConcessionModelFromJson(json);

  /// Convert to entity
  Concession toEntity() {
    return Concession(
      id: id,
      name: name,
      description: description,
      concessionType: concessionType.toConcessionType(),
      price: price,
      imageUrl: imageUrl,
      isAvailable: isAvailable,
      isCombo: isCombo,
      comboItems: comboItems,
    );
  }
}

/// Data model for creating concession in booking
@freezed
abstract class BookingConcessionInputModel with _$BookingConcessionInputModel {
  const factory BookingConcessionInputModel({
    @JsonKey(name: 'concession_id') required String concessionId,
    required int quantity,
  }) = _BookingConcessionInputModel;

  factory BookingConcessionInputModel.fromJson(Map<String, dynamic> json) =>
      _$BookingConcessionInputModelFromJson(json);
}

/// Extension to create BookingConcessionInputModel from ConcessionSelection
extension ConcessionSelectionX on ConcessionSelection {
  BookingConcessionInputModel toInputModel() {
    return BookingConcessionInputModel(
      concessionId: concession.id,
      quantity: quantity,
    );
  }
}
