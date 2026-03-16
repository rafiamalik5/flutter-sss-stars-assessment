import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home/models/product_model.dart';
import '../../home/models/product_isar.dart';
import '../../../services/firestore_service.dart';
import '../../../services/isar_service.dart';

final productsCacheProvider = FutureProvider<List<Product>>((ref) async {
  final isarService = IsarService();
  final firestoreService = FirestoreService();

  // check local cache
  final cached = await isarService.getProducts();
  if (cached.isNotEmpty) {
    return cached
        .map((e) => Product(
            id: e.id.toString(),
            name: e.name,
            price: e.brand, // adjust fields as needed
            brand: e.brandName,
            image: e.image))
        .toList();
  }

  // fetch from Firestore
  final products = await firestoreService.getProducts();

  // save to Isar
  final isarProducts = products
      .map((e) => ProductIsar()
        ..name = e.name
        ..brand = e.price as String
        ..brandName = e.brand
        ..image = e.image)
      .toList();

  await isarService.addProducts(isarProducts);

  return products;
});