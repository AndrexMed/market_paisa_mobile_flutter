import '../entities/entities.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
}
