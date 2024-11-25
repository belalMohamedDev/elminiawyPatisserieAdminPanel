import 'package:elminiawy/feature/sideMenu/logic/sideMenuCuibt/side_menu_cubit.dart';
import 'package:elminiawy/feature/sideMenu/presentation/refactor/home_body_screen.dart';
import 'package:elminiawy/feature/sideMenu/presentation/refactor/side_menu.dart';

import '../../../../../core/common/shared/shared_imports.dart'; 

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  @override
  void initState() {
    instance<ProductCubit>().getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<SideMenuCubit, SideMenuState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManger.brun,
          body: Row(
            children: [
              /// Side menu with dynamic titles and sub-items.
              Expanded(
                child: SideMenu(
                  selectedPage: instance<SideMenuCubit>().currentPageTitle,
                  onItemTap: instance<SideMenuCubit>().onItemTap,
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
                  child: instance<SideMenuCubit>().allPages[
                          instance<SideMenuCubit>().currentPageTitle] ??
                      const HomeScreen(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
