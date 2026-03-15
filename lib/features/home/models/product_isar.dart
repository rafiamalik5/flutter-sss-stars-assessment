import 'package:isar/isar.dart';

part 'product_isar.g.dart';

@collection
class ProductIsar {
  Id id = Isar.autoIncrement;

  late String name;
  late double price;
  late String brand;
  late String image;
}
