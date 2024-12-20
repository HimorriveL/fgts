import '../../domain/entities/all.dart';
import '../http/all.dart';

class ProductModel {
  final String id;
  final String name;

  ProductModel({
    required this.id,
    required this.name,
  });

  factory ProductModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'id',
      'name',
    ])) {
      throw HttpError.invalidData;
    }

    return ProductModel(
      id: json['id'],
      name: json['name'],
    );
  }

  ComboboxEntity toEntity() => ComboboxEntity(
        value: id,
        display: name,
      );
}
