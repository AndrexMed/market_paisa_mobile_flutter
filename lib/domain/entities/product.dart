import 'package:market_paisa/infrastructure/models/product/products_api_response.dart';

class Product {
  final int id;
  final String title;
  final int price;
  final String description;
  final Category category;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });
}

class Category {
  final int id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  static fromApiResponse(CategoryApiResponse category) {
    return Category(
      id: category.id,
      name: category.name,
      image: category.image,
    );
  }
}
