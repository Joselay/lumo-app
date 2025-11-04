import 'package:freezed_annotation/freezed_annotation.dart';

part 'concession.freezed.dart';

/// Enum for concession types
enum ConcessionType {
  food,
  beverage,
  combo,
  snack,
}

/// Extension to convert string to ConcessionType
extension ConcessionTypeExtension on String {
  ConcessionType toConcessionType() {
    switch (toLowerCase()) {
      case 'food':
        return ConcessionType.food;
      case 'beverage':
        return ConcessionType.beverage;
      case 'combo':
        return ConcessionType.combo;
      case 'snack':
        return ConcessionType.snack;
      default:
        return ConcessionType.snack;
    }
  }
}

/// Represents a concession item available for purchase
@freezed
abstract class Concession with _$Concession {
  const factory Concession({
    required String id,
    required String name,
    required String description,
    required ConcessionType concessionType,
    required double price,
    String? imageUrl,
    required bool isAvailable,
    required bool isCombo,
    String? comboItems,
  }) = _Concession;
}

/// Represents a selected concession with quantity
@freezed
abstract class ConcessionSelection with _$ConcessionSelection {
  const ConcessionSelection._();

  const factory ConcessionSelection({
    required Concession concession,
    required int quantity,
  }) = _ConcessionSelection;

  /// Calculate subtotal for a concession selection
  double get subtotal => concession.price * quantity;
}
