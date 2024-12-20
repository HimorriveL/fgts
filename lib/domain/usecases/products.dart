import '../entities/all.dart';

abstract class IFindAllProducts {
  Future<List<ComboboxEntity>> execute();
}
