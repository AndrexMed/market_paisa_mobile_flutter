class ProductsApiResponse {
  final int id;
  final String title;
  // final int price;
  final double price;
  final String description;
  // final CategoryApiResponse category;
  // final List<String> images;
  final String category;
  final String image;
  final RatingApiResponse rating;

  ProductsApiResponse({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    // required this.images,
    required this.image,
    required this.rating,
  });

  factory ProductsApiResponse.fromJson(Map<String, dynamic> json) {
    return ProductsApiResponse(
      id: json['id'],
      title: json['title'],
      price: json['price'] is int ? json['price'].toDouble() : json['price'],
      description: json['description'],
      // category: CategoryApiResponse.fromJson(json['category']),
      // images: List<String>.from(json['images']),
      category: json['category'],
      image: json['image'],
      rating: RatingApiResponse.fromJson(json['rating']),
    );
  }
}

class CategoryApiResponse {
  final int id;
  final String name;
  final String image;

  CategoryApiResponse({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryApiResponse.fromJson(Map<String, dynamic> json) {
    return CategoryApiResponse(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class RatingApiResponse {
  final double rate;
  final int count;

  RatingApiResponse({
    required this.rate,
    required this.count,
  });

  factory RatingApiResponse.fromJson(Map<String, dynamic> json) {
    return RatingApiResponse(
      rate: json['rate'] is int ? json['rate'].toDouble() : json['rate'],
      count: json['count'],
    );
  }
}
