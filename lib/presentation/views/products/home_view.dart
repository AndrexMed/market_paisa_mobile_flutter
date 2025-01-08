import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_paisa/presentation/providers/products/initial_loading_provider.dart';
import 'package:market_paisa/presentation/providers/products/products_providers.dart';
import 'package:market_paisa/presentation/widgets/shared/custom_app_bar.dart';
import 'package:market_paisa/presentation/widgets/shared/full_screen_loader.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(productsProvider.notifier).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) {
      return const FullScreenLoader();
    }

    final products = ref.watch(productsProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          centerTitle: false,
          flexibleSpace: FlexibleSpaceBar(
            title: SizedBox(
              width: double.infinity,
              child: CustomAppBar(),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = products[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text(product.price.toString()),
              onTap: () {
                // ref.read(productsProvider.notifier).getProduct(product.id);
                // Navigator.of(context).pushNamed('product/${product.id}');
              },
            );
          },
          childCount: products.length,
        ))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
