import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_paisa/domain/entities/entities.dart';
import 'package:market_paisa/presentation/providers/products/product_repository_provider.dart';

final productsProvider =
    StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  final fetchMoreProducts = ref.watch(productRepositoryProvider).getProducts;
  return ProductsNotifier(fetchMoreProducts: fetchMoreProducts);
});

typedef ProductCallback = Future<List<Product>> Function();

class ProductsNotifier extends StateNotifier<List<Product>> {
  bool isLoading = false;
  ProductCallback fetchMoreProducts;

  ProductsNotifier({required this.fetchMoreProducts}) : super([]);

  bool get isEmpty => state.isEmpty;

  Future<void> getProducts() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    final List<Product> products = await fetchMoreProducts();
    state = [...state, ...products];

    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
  }
}
