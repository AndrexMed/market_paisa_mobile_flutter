import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const name = 'ProductScreen';
  final String productId;
  const ProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
      ),
      body: Center(
        child: Text('Product ID: $productId'),
      ),
    );
  }
}
