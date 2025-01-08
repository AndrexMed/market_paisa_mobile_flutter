import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_paisa/presentation/providers/products/products_providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final products = ref.watch(productsProvider).isEmpty;

  if (products) {
    return true;
  }
  return false;
});
