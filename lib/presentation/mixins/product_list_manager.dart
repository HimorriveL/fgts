

import 'package:get/get.dart';

import '../../domain/entities/all.dart';

mixin ProductListManager on GetxController {
  final _productList = Rx<List<ProductEntity>>([]);
  Stream<List<ProductEntity>> get productListStream => _productList.stream;
  set productList(List<ProductEntity> value) => _productList.value = value;
  List<ProductEntity> get productList => _productList.value;
}
