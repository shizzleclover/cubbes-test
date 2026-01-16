import 'package:cubbestest/data/models/product_model.dart';

class ProductApiService {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<ProductModel>> fetchProducts() async {
    try{
      final response = await http.get(Uri.parse('$baseUrl/products'));

      if(response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        
      }
    }
  }
}