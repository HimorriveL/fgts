import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final int? code;
  final bool active;
  final String name;
  final String ncm;
  final String cfop;
  final String unitComercial;
  final String categoryId;
  final String markup;
  final String buttonBackgroundColor;
  final String buttonForegroundColor;
  final String? providerId;
  final String? supplierBarCode;
  final String? supplierCode;
  final int toFor;
  final double valueCost;
  final double unitCost;
  final double valueSell;
  final double stock;

  @override
  List get props => [
        id,
        code,
        name,
        ncm,
        cfop,
        unitComercial,
        categoryId,
        buttonBackgroundColor,
        buttonForegroundColor,
        providerId,
        supplierBarCode,
        supplierCode,
        toFor,
        valueCost,
        valueSell,
        unitCost,
        active,
        stock,
      ];

  const ProductEntity({
    required this.id,
    required this.code,
    required this.name,
    required this.ncm,
    required this.cfop,
    required this.markup,
    required this.unitComercial,
    required this.categoryId,
    required this.buttonBackgroundColor,
    required this.buttonForegroundColor,
    required this.providerId,
    required this.supplierBarCode,
    required this.supplierCode,
    required this.toFor,
    required this.valueCost,
    required this.valueSell,
    required this.unitCost,
    required this.active,
    required this.stock,
  });

  Map toJson() {
    Map json = {
      'active': active,
      'name': name,
      'ncm': ncm,
      'cfop': cfop,
      'unit_type': unitComercial,
      'categories_id': categoryId,
      'button_background_color': buttonBackgroundColor,
      'button_font_color': buttonForegroundColor,
      'providers_id': providerId,
      'supplier_code': supplierCode,
      'supplier_bar_code': supplierBarCode,
      'to_for': toFor,
      'value_cost': valueCost,
      'value_sell': valueSell,
    };

    if (id != null) {
      json['id'] = id;
      json['code'] = code;
    }

    return json;
  }

  static ProductEntity getEmpty() => const ProductEntity(
        id: "",
        code: 0,
        name: "",
        ncm: "",
        cfop: "",
        unitComercial: "",
        categoryId: "",
        buttonBackgroundColor: "#000000",
        buttonForegroundColor: "#FFFFFF",
        providerId: "",
        supplierBarCode: "",
        supplierCode: "",
        toFor: 1,
        valueCost: 0,
        valueSell: 0,
        active: true,
        unitCost: 0,
        markup: '0%',
        stock: 0,
      );
}
