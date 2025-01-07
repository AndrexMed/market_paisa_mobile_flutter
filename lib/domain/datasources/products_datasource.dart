import '../entities/entities.dart';

abstract class ProductsDatasource {
  Future<List<Product>> getProducts();
}
