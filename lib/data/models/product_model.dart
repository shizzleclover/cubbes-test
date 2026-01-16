class ProductModel {
  int id;
  String title;
  double price;
  String description;
  List<String> category;
  String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });
}
 
 ProductModel.FromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    description = json['description'];
    category = List<String>.from(json['category']);
    image = json['image'];
 }