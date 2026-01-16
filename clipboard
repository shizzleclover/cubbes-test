import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductApiService {
  // The base URL provided in the assessment
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products'));

      if (response.statusCode == 200) {
        // Decode the JSON list
        final List<dynamic> jsonList = json.decode(response.body);
        
        // Convert each JSON object into a ProductModel
        return jsonList.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      // Pass the error up to be handled by the UI
      throw Exception('Network error: $e');
    }
  }
}