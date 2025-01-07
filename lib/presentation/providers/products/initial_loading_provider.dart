import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_paisa/presentation/providers/products/products_providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final getProducts = ref.watch(productsProvider.notifier).isEmpty;

  if (getProducts) {
    return true;
  }

  return false;
});
