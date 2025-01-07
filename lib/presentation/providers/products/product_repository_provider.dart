import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_paisa/infrastructure/datasources/product_datasource.dart';
import 'package:market_paisa/infrastructure/repositories/product_repository_implementation.dart';

final productRepositoryProvider = Provider((ref) =>
    ProductRepositoryImplementation(productDatasource: ProductApiDatasource()));
