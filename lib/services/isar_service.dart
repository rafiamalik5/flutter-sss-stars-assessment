import 'package:isar/isar.dart';
import '../features/home/models/product_isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late final Future<Isar> db;

  IsarService() {
    db = _initDb();
  }

  Future<Isar> _initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [ProductIsarSchema],
      directory: dir.path,
    );
  }

  Future<void> addProducts(List<ProductIsar> products) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.productIsars.putAll(products);
    });
  }

  Future<List<ProductIsar>> getProducts() async {
    final isar = await db;
    return await isar.productIsars.where().findAll();
  }

  Future<void> clearProducts() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.productIsars.clear();
    });
  }
}