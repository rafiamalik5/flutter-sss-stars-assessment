import 'package:isar/isar.dart';

part 'product_isar.g.dart';

@collection
class ProductIsar {
  Id id = Isar.autoIncrement;

  late String name;
  late double brand;
  late String image;
  late String brandName;
}