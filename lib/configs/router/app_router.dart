import 'package:go_router/go_router.dart';

import '../../presentation/screens.dart';

final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = state.pathParameters['page'] ?? '0';
        return HomeScreen(pageIndex: int.parse(pageIndex));
      },
      routes: [
        GoRoute(
          path: 'product/:productId',
          name: ProductScreen.name,
          builder: (context, state) {
            final productId = state.pathParameters['productId'] ?? 'No Id';
            return ProductScreen(productId: productId);
          },
        ),
      ]),
  GoRoute(
    path: '/',
    redirect: (_, __) => '/home/0',
  )
]);
