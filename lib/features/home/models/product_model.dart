class Product {
  final String id;
  final String name;
  final double price;
  final String brand;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.brand,
    required this.image,
  });

  // From Firestore
  factory Product.fromMap(Map<String, dynamic> data, String documentId) {
    return Product(
      id: documentId,
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      brand: data['brand'] ?? '',
      image: data['image'] ?? '',
    );
  }
}
