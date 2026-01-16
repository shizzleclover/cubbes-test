import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../screens/product_detail_screen.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // 1. Image Container (Fixed Size 50x50)
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(2),
                color: Colors.white,
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (ctx, error, stackTrace) =>
                      const Icon(Icons.error, size: 24, color: Colors.grey),
                ),
              ),
              
              const SizedBox(width: 12), // Spacing

              // 2. Title and Price (Flexible width)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // 3. Arrow Icon
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}