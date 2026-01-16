import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../services/product_api_service.dart';

class ProductRepositoryImpl implements ProductRepository {
  // 1. Declare the dependency
  final ProductApiService apiService;

  // 2. Create the constructor that requires this dependency
  ProductRepositoryImpl({required this.apiService});

  @override
  Future<List<Product>> getProducts() async {
    return await apiService.fetchProducts();
  }
}