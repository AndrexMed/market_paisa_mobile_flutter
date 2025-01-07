import 'package:dio/dio.dart';
import 'package:market_paisa/domain/entities/product.dart';
import 'package:market_paisa/configs/constants/environment.dart';
import 'package:market_paisa/domain/datasources/products_datasource.dart';
import 'package:market_paisa/infrastructure/mappers/product_mapper.dart';
import 'package:market_paisa/infrastructure/models/product/products_api_response.dart';

class ProductApiDatasource extends ProductsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseApiUrl,
  ));

  List<Product> _jsonToProducts(List<dynamic> json) {
    final productsResponse = json
        .map((item) => ProductsApiResponse.fromJson(
            item)) // Convertir cada elemento en ProductsApiResponse
        .toList();

    // Convertir ProductsApiResponse en Product
    final List<Product> products = productsResponse
        .map(
            (productResponse) => ProductMapper.fromApiToEntity(productResponse))
        .toList();

    return products;
  }

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await dio.get('/products');
      final productsJson =
          response.data as List<dynamic>; // Recibimos la lista directamente

      // Usamos el método _jsonToProducts para convertir el JSON en productos
      return _jsonToProducts(productsJson);
    } catch (e) {
      // Manejo de errores
      throw Exception('Failed to load products: $e');
    }
  }
}
