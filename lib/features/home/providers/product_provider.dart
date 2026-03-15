import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home/models/product_model.dart';
import '../../../services/firestore_service.dart';

final productProvider = FutureProvider<List<Product>>((ref) async {
  final service = FirestoreService();
  return service.getProducts();
});
