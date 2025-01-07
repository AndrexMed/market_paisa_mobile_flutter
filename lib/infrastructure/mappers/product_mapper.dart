import 'package:market_paisa/domain/entities/entities.dart';
import 'package:market_paisa/infrastructure/models/product/products_api_response.dart';

class ProductMapper {
  static Product fromApiToEntity(ProductsApiResponse productApiResponse) {
    return Product(
      id: productApiResponse.id,
      title: productApiResponse.title,
      description: productApiResponse.description,
      price: productApiResponse.price,
      category: Category(
        id: productApiResponse.category.id,
        name: productApiResponse.category.name,
        image: productApiResponse.category.image,
      ),
      images: productApiResponse.images,
    );
  }
}
