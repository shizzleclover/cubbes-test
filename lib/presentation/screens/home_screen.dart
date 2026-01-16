import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/product_provider.dart';
import '../widgets/product_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          // 1. Handle Loading State
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Handle Error State
          if (provider.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text('Error: ${provider.errorMessage}'),
                  TextButton(
                    onPressed: () => provider.loadProducts(),
                    child: const Text('Retry'),
                  )
                ],
              ),
            );
          }

          // 3. Handle Success State (Show Data)
          if (provider.products.isEmpty) {
            return const Center(child: Text('No products found.'));
          }

          return ListView.builder(
            itemCount: provider.products.length + 1, // +1 for the Header
            itemBuilder: (context, index) {
              // The first item is the Header Image
              if (index == 0) {
                return _buildHeader();
              }

              // The rest are product items (index - 1 because of header)
              final product = provider.products[index - 1];
              return ProductListItem(product: product);
            },
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      color: Colors.grey[300], // Placeholder color
      child: Image.network(
        // Using a random placeholder image as per requirements
        'https://picsum.photos/800/400', 
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Text('Featured Image', style: TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}