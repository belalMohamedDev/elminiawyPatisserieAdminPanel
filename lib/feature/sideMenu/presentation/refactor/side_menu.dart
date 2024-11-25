import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/sideMenu/logic/sideMenuCuibt/side_menu_cubit.dart';

class SideMenu extends StatefulWidget {
  final String selectedPage;
  final Function(String) onItemTap;

  const SideMenu({
    super.key,
    required this.selectedPage,
    required this.onItemTap,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<SideMenuCubit, SideMenuState>(
      builder: (context, state) {
        final cubit = context.read<SideMenuCubit>();
        return Drawer(
          backgroundColor: ColorManger.brownLight,
          child: Column(
            children: [
              Padding(
                padding: responsive.setPadding(top: 12, right: 1, bottom: 7),
                child: Image.asset(
                  ImageAsset.shoppingBag,
                  color: ColorManger.white,
                  height: responsive.setHeight(
                    responsive.responsiveValue(
                        desktop: 10, tablet: 10, mobile: 4),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cubit.menuItems.length,
                  itemBuilder: (context, index) {
                    final item = cubit.menuItems[index];
                    final hasChildren = item['children'] != null;
                    final isExpanded = cubit.expandedIndexes.contains(index);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: widget.selectedPage == item['title'] ||
                                      (item['children'] != null &&
                                          item['children'].any((child) =>
                                              child['title'] ==
                                              widget.selectedPage))
                                  ? ColorManger.brunLight
                                  : ColorManger.brun,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(
                                      responsive.setBorderRadius(0.8)),
                                  topRight: Radius.circular(
                                      responsive.setBorderRadius(0.8)))),
                          child: ListTile(
                            onTap: () {

                              if (hasChildren) {
                                cubit.toggleExpansion(index);
                                cubit.onItemTap(item['title']);
                              } else {
                                cubit.expandedIndexes.clear();
                                cubit.onItemTap(item['title']);
                              }
                            },
                            horizontalTitleGap: 25.0,
                            leading: Icon(
                              item['icon'],
                              color: ColorManger.white,
                            ),
                            title: Text(
                              item['title'],
                              style: TextStyle(
                                color: ColorManger.white,
                                fontSize: responsive.setTextSize(
                                  responsive.responsiveTextSize(
                                    desktop: 1.3,
                                    tablet: 1.3,
                                    mobile: 3.8,
                                  ),
                                ),
                              ),
                            ),
                            trailing: hasChildren
                                ? Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: ColorManger.white,
                                  )
                                : null,
                          ),
                        ),
                        if (isExpanded)
                          Padding(
                            padding:
                                EdgeInsets.only(left: responsive.setWidth(2)),
                            child: Column(
                              children: List.generate(item['children'].length,
                                  (childIndex) {
                                final child = item['children'][childIndex];
                                return ListTile(
                                  onTap: () {
                                    widget.onItemTap(child['title']);
                                  },
                                  leading: Icon(
                                    child['icon'],
                                    color: ColorManger.white,
                                  ),
                                  title: Text(
                                    child['title'],
                                    style: TextStyle(
                                      color: ColorManger.white,
                                      fontSize: responsive.setTextSize(
                                        responsive.responsiveTextSize(
                                          desktop: 1.2,
                                          tablet: 1.2,
                                          mobile: 3.6,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
