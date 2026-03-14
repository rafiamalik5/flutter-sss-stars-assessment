import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/features/home/providers/products_cache_provider.dart';
import '../models/product_model.dart';

import 'product_details_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productsCacheProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('SSS Shop')),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: productsAsync.when(
          data: (products) => Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final isSelected = index == 0; // example for highlight
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: isSelected
                      ? const EdgeInsets.all(16)
                      : const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? Colors.blue.shade50 : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      if (isSelected)
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailsScreen(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Hero(
                          tag: product.id,
                          child: Image.network(
                            product.image,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("\$${product.price.toString()}"),
                        Text(
                          product.brand,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          loading: () =>
              const Center(child: CircularProgressIndicator()),
          error: (err, stack) =>
              Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}
