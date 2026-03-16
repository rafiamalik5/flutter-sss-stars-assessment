import 'package:isar/isar.dart';

part 'product_isar.g.dart';

@collection
class ProductIsar {
  Id id = Isar.autoIncrement;

  late String name;
  late String brand;   // changed to String
  late String image;
  late String brandName;

  double? get price => null;

  set price(double price) {}
}