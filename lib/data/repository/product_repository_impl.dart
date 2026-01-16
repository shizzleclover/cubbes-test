import 'package:cubbestest/data/services/product_api_service.dart';
import 'package:cubbestest/domain/entities/product.dart';
import 'package:cubbestest/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  late final ProductApiService apiService;

  @override
  Future<List<Product>> getProducts() async {
    return await apiService.fetchProducts();
  }
}

 
