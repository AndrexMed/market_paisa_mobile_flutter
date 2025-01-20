import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:market_paisa/domain/entities/product.dart';

class ProductsSlideshow extends StatelessWidget {
  final List<Product> products;
  const ProductsSlideshow({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _Slide(
            product: product,
          );
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Product product;
  const _Slide({required this.product});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ],
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(product.images[0])));

    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product.images[0],
                errorBuilder: (context, error, stackTrace) =>
                    const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Center(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    // return child;
                    return FadeIn(child: child);
                  }
                  return const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
              )),
        ));
  }
}
