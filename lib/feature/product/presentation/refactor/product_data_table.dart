import 'package:elminiawy/core/common/shared/shared_imports.dart';

class ProductDataTable extends StatelessWidget {
  const ProductDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return SizedBox(
          width: responsive.screenWidth,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: responsive.setPadding(left: 2, bottom: 5),
              child: DataTable(
                decoration: BoxDecoration(
                    color: ColorManger.brun,
                    border: Border.all(
                        color: ColorManger.brun,
                        width: responsive.setWidth(0.13)),
                    borderRadius:
                        BorderRadius.circular(responsive.setBorderRadius(0.9))),
                columnSpacing: responsive.setWidth(5),
                dataRowMinHeight: responsive.setHeight(2),
                dataRowMaxHeight: responsive.setHeight(6),
                columns: dataTableColumn(context),
                rows: instance<ProductCubit>()
                    .dataList
                    .map((product) => dataTableRow(context, product))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  List<DataColumn> dataTableColumn(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return [
      DataColumn(
          label: SizedBox(
        width: responsive.setWidth(5),
        child: Text(
          context.translate(AppStrings.image),
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: responsive.setTextSize(1), // Uses theme styling
              ),
        ),
      )),
      DataColumn(
          label: SizedBox(
        width: responsive.setWidth(10.5),
        child: Text(
          context.translate(AppStrings.name),
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: responsive.setTextSize(1),
              ),
        ),
      )),
      DataColumn(
          label: SizedBox(
        width: responsive.setWidth(12),
        child: Text(
          context.translate(AppStrings.description),
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: responsive.setTextSize(1), // Uses theme styling
              ),
        ),
      )),
      DataColumn(
          label: SizedBox(
        width: responsive.setWidth(3),
        child: Text(
          context.translate(AppStrings.price),
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: responsive.setTextSize(1), // Uses theme styling
              ),
        ),
      )),
      DataColumn(
          label: SizedBox(
        width: responsive.setWidth(11),
        child: Text(
          context.translate(AppStrings.category),
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: responsive.setTextSize(1), // Uses theme styling
              ),
        ),
      )),
      DataColumn(
          label: SizedBox(
        width: responsive.setWidth(7),
        child: Text(
          context.translate(AppStrings.procedures),
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: responsive.setTextSize(1), // Uses theme styling
              ),
        ),
      )),
    ];
  }

  DataRow dataTableRow(BuildContext context, DataProductResponse product) {
    final responsive = ResponsiveUtils(context);
    return DataRow(
      cells: [
        DataCell(CachedNetworkImage(
          imageUrl: product.image!,
          width: 60,
          height: 60,
          placeholder: (context, url) => const LoadingShimmer(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )),
        DataCell(SizedBox(
            width: responsive.setWidth(10),
            child: Text(
              product.title!,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(1),
                  ),
            ))),
        DataCell(SizedBox(
            width: responsive.setWidth(12),
            child: Text(
              product.description!,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(1), // Uses theme styling
                  ),
            ))),
        DataCell(SizedBox(
            width: responsive.setWidth(3),
            child: Text(
              '${product.price}',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(1), // Uses theme styling
                  ),
            ))),
        DataCell(SizedBox(
            width: responsive.setWidth(12),
            child: Text(
              product.category!,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: responsive.setTextSize(1),
                    // Uses theme styling
                  ),
            ))),
        DataCell(
          SizedBox(
            width: responsive.setWidth(7),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: ColorManger.white),
                  onPressed: () {
                    _editProduct(context, product);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: ColorManger.white),
                  onPressed: () {
                    _deleteProduct(context, product);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _editProduct(BuildContext context, DataProductResponse product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تعديل المنتج'),
        content: Text('هل تريد تعديل المنتج: ${product.title}؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              // منطق التعديل
              Navigator.pop(context);
            },
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }

  void _deleteProduct(BuildContext context, DataProductResponse product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف المنتج'),
        content: Text('هل تريد حذف المنتج: ${product.title}؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              // منطق الحذف
              Navigator.pop(context);
            },
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }
}
