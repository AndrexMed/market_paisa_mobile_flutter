class ProductsApiResponse {
  final int id;
  final String title;
  final int price;
  final String description;
  final CategoryApiResponse category;
  final List<String> images;

  ProductsApiResponse({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory ProductsApiResponse.fromJson(Map<String, dynamic> json) {
    return ProductsApiResponse(
      id: json['id'] as int,
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: CategoryApiResponse.fromJson(json['category']),
      images: List<String>.from(json['images']),
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
