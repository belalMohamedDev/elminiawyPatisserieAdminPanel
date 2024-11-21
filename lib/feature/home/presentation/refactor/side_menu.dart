import 'package:elminiawy/core/common/shared/shared_imports.dart';

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
  final List<int> _expandedIndexes = [];

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    /// Menu items with sub-items
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
                responsive.responsiveValue(desktop: 10, tablet: 10, mobile: 4),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final hasChildren = item['children'] != null;
                final isExpanded = _expandedIndexes.contains(index);

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
                            setState(() {
                              if (isExpanded) {
                                _expandedIndexes.remove(index);
                              } else {
                                _expandedIndexes.clear();
                                _expandedIndexes.add(index);
                              }
                            });
                            widget.onItemTap(item['title']);
                          } else {
                            _expandedIndexes.clear();
                            widget.onItemTap(item['title']);
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
                        padding: EdgeInsets.only(left: responsive.setWidth(2)),
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
  }
}
