import 'package:market_paisa/infrastructure/models/product/products_api_response.dart';

class Product {
  final int id;
  final String title;
  // final int price;
  final double price;
  final String description;
  // final Category category;
  // final List<String> images;
  final String category;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    // required this.images,
    required this.image,
    required this.rating,
  });
}

//No se usa debido a la migracion de api
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
//-------------------------------------------------------

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  static fromApiResponse(RatingApiResponse rating) {
    return Rating(
      rate: rating.rate,
      count: rating.count,
    );
  }
}
