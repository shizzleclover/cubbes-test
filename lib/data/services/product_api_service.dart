class ProductApiService {
  Future<void> fetchProducts() async {
    String baseUrl = "https://fakestoreapi.com/docs /products";

    try {
      await Future.delayed(const Duration(seconds: 5));

    }
    catch(e) {
      throw Exception('Failed to load products Please retry again.');
      )
    }
  }
}
