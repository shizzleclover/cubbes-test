import 'package:cubbestest/data/repository/product_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/services/product_api_service.dart';
import 'presentation/state/product_provider.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(
        repository: ProductRepositoryImpl(
          apiService: ProductApiService(),
        ),
      )..loadProducts(),
      child: MaterialApp(
        title: 'Clean Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}