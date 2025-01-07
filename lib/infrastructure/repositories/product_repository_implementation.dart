import 'package:market_paisa/domain/datasources/products_datasource.dart';
import 'package:market_paisa/domain/repositories/product_repository.dart';

import '../../domain/entities/entities.dart';

class ProductRepositoryImplementation extends ProductsRepository {
  final ProductsDatasource productDatasource;

  ProductRepositoryImplementation({required this.productDatasource});

  @override
  Future<List<Product>> getProducts() {
    return productDatasource.getProducts();
  }
}
