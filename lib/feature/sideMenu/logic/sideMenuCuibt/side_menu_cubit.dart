import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/product/presentation/screen/add_new_product.dart';
import 'package:elminiawy/feature/sideMenu/presentation/refactor/home_body_screen.dart';
import 'package:elminiawy/feature/sideMenu/presentation/refactor/prod.dart';

part 'side_menu_state.dart';
part 'side_menu_cubit.freezed.dart';

class SideMenuCubit extends Cubit<SideMenuState> {
  SideMenuCubit() : super(const SideMenuState.initial());

  final Map<String, Widget> allPages = {
    "Home": const HomeScreen(),
    "Products": const ProductsPage(),
    "Category": const CategoryPage(),
    "SubCategory": const SubCategoryPage(),
    "Banner": const BannerPage(),
    "Orders": const OrdersPage(),
    "Settings": const SettingsPage(),
    "AddProduct": const CreateNewProductScreen(),
  };

  final List<Map<String, dynamic>> menuItems = [
    {"title": "Home", "icon": IconlyBold.home, "children": null},
    {"title": "Products", "icon": IconlyBold.discount, "children": null},
    {
      "title": "Category",
      "icon": IconlyBold.category,
      "children": [
        {"title": "SubCategory", "icon": IconlyBold.category},
      ],
    },
    {"title": "Banner", "icon": IconlyBold.image, "children": null},
    {"title": "Orders", "icon": IconlyBold.bag, "children": null},
    {"title": "Settings", "icon": IconlyBold.setting, "children": null},
  ];

  String currentPageTitle = "Home";

  final List<int> expandedIndexes = [];

  void onItemTap(String pageTitle) {
    currentPageTitle = pageTitle;

    emit(SideMenuState.pageSelected(
      currentPageTitle,
    ));
  }

  void toggleExpansion(int index) {
    if (expandedIndexes.contains(index)) {
      expandedIndexes.remove(index);
    } else {
      expandedIndexes.clear();
      expandedIndexes.add(index);
    }

    emit(SideMenuState.toggleExpansion(expandedIndexes));
  }
}
