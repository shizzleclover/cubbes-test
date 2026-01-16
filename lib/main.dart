import 'package:cubbestest/data/repository/product_repository_impl.dart';
import 'package:cubbestest/data/services/product_api_service.dart';
import 'package:cubbestest/presentation/screens/home_screen.dart';
import 'package:cubbestest/presentation/state/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
      ChangeNotifierProvider(
          create: (context) => ProductProvider(
            repository: ProductRepositoryImpl(

              apiService: ProductApiService(), 
            ),
          )..loadProducts(),
        ),
       ],
    );
  }
}