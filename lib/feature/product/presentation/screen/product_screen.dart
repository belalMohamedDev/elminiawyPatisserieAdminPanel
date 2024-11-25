import 'package:elminiawy/feature/product/presentation/refactor/productScreenRefactor/product_data_table.dart';
import 'package:elminiawy/feature/product/presentation/refactor/productScreenRefactor/product_list_and_add_product_button.dart';
import 'package:elminiawy/feature/product/presentation/refactor/productScreenRefactor/search_product.dart';

import '../../../../../core/common/shared/shared_imports.dart'; //

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    if (instance<ProductCubit>().dataList.isEmpty) {
      instance<ProductCubit>().getProduct();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Container(
      decoration: BoxDecoration(
          color: ColorManger.white,
          borderRadius: BorderRadius.circular(responsive.setBorderRadius(1.5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductListAndAddProductButton(),
          responsive.setSizeBox(height: 3),
          const SearchWidget(),
          const ProductDataTable(),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is GetProductLoading || state is GetProductError) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorManger.brun,
                  ),
                );
              }

              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
