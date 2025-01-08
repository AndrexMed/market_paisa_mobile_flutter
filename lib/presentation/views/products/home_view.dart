import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_paisa/presentation/providers/products/initial_loading_provider.dart';
import 'package:market_paisa/presentation/providers/products/products_provider.dart';
import 'package:market_paisa/presentation/widgets/shared/custom_app_bar.dart';
import 'package:market_paisa/presentation/widgets/shared/full_screen_loader.dart';
import 'package:market_paisa/presentation/widgets/shared/side_menu.dart';

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
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Market Paisa'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.title),
            subtitle: Text(product.price.toString()),
            onTap: () {},
          );
        },
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
