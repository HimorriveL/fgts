import '../../domain/entities/all.dart';

import 'package:get/get.dart';

mixin ProductManager on GetxController {
  late final _product = Rx<ProductEntity>(ProductEntity.getEmpty());
  Stream<ProductEntity> get productStream => _product.stream;
  set product(ProductEntity value) => _product.value = value;
  ProductEntity get product => _product.value;
}
