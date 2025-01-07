import 'package:flutter/material.dart';
import 'package:market_paisa/presentation/views/products/cart_view.dart';
import 'package:market_paisa/presentation/views/products/home_view.dart';
import 'package:market_paisa/presentation/views/products/profile_view.dart';
import 'package:market_paisa/presentation/widgets/shared/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'HomeScreen';
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget>[HomeView(), CartView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_pageController.hasClients) {
      _pageController.animateToPage(widget.pageIndex,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: widget.pageIndex,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
