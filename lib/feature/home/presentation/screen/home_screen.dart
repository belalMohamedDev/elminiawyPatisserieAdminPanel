import 'package:elminiawy/feature/home/presentation/refactor/home_body_screen.dart';
import 'package:elminiawy/feature/home/presentation/refactor/prod.dart';
import 'package:elminiawy/feature/home/presentation/refactor/side_menu.dart';

import '../../../../../core/common/shared/shared_imports.dart'; // Shared imports for project utilities

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Map to hold all possible pages, including sub-pages.
  final Map<String, Widget> _allPages = {
    "Home": const HomeBody(),
    "Products": const ProductsPage(),
    "Category": const CategoryPage(),
    "SubCategory": const SubCategoryPage(),
    "Banner": const BannerPage(),
    "Orders": const OrdersPage(),
    "Settings": const SettingsPage(),
  };

  String _currentPageTitle = "Home";

  void _onItemTap(String pageTitle) {
    setState(() {
      _currentPageTitle = pageTitle;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      backgroundColor: ColorManger.brun,
      body: Row(
        children: [
          /// Side menu with dynamic titles and sub-items.
          Expanded(
            child: SideMenu(
              selectedPage: _currentPageTitle,
              onItemTap: _onItemTap,
            ),
          ),

          /// Display the currently selected page.
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(
                top: responsive.setHeight(2),
                bottom: responsive.setHeight(1.5),
                right: responsive.setWidth(1),
                left: responsive.setWidth(1),
              ),
              child: _allPages[_currentPageTitle] ?? const HomeBody(),
            ),
          ),
        ],
      ),
    );
  }
}
