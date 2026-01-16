import 'package:cubbestest/domain/entities/product.dart';
import 'package:cubbestest/presentation/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black12),
        borderRadius: BorderRadius.circular(4),
      ),

      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: Image.network(
            product.image,
            fit: BoxFit.contain,
            errorBuilder: (ctx, error, stackTrace) => const Icon(Icons.error),
          ),
        ),
        title: Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),

        subtitle: Text(
          product.price.toStringAsFixed(2),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: product),
            ),
          );
        },
      ),
    );
  }
}
