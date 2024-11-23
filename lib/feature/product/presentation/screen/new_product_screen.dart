import '../../../../../core/common/shared/shared_imports.dart'; //

class NewProductView extends StatelessWidget {
  const NewProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.translate(AppStrings.newProductsInStore),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 16.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        child: const NewProductBody(),
      ),
    );
  }
}

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    instance<ProductCubit>().getProduct();
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
          Padding(
            padding: responsive.setPadding(top: 8, left: 2, right: 2),
            child: Row(
              children: [
                Text(
                  "Products",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize:
                            responsive.setTextSize(2), // Uses theme styling
                      ),
                ),
                const Spacer(),
                CustomButton(
                    width: 10,
                    radius: 0.9,
                    onPressed: () {},
                    widget: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: ColorManger.white,
                        ),
                        Text(
                          "Add Product",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: responsive
                                    .setTextSize(1), // Uses theme styling
                              ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          responsive.setSizeBox(height: 3),
          Padding(
            padding: responsive.setPadding(left: 54.5, bottom: 5),
            child: SizedBox(
              height: responsive.setHeight(5.5),
              width: responsive.setWidth(25),
              child: TextFormField(
                onChanged: (value) => context
                    .read<SearchBloc>()
                    .add(SearchEvent.searchText(value)),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: context.translate(AppStrings.findYourPatisserie),
                    prefixIcon: Icon(IconlyBroken.search,
                        size: responsive.setIconSize(2),
                        color: ColorManger.white),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: responsive.setTextSize(1)),
                    fillColor: ColorManger.brun,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorManger.brun,
                      ),
                      borderRadius: BorderRadius.all(Radius.elliptical(
                        responsive.setBorderRadius(0.9),
                        responsive.setBorderRadius(0.9),
                      )),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorManger.brun,
                      ),
                      borderRadius: BorderRadius.all(Radius.elliptical(
                          responsive.setBorderRadius(0.9),
                          responsive.setBorderRadius(0.9))),
                    )),
              ),
            ),
          ),
          BlocBuilder<ProductCubit, ProductState>(
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
                          borderRadius: BorderRadius.circular(
                              responsive.setBorderRadius(0.9))),
                      columnSpacing: responsive.setWidth(5),
                      dataRowMinHeight: responsive.setHeight(2),
                      dataRowMaxHeight: responsive.setHeight(6),
                      columns: [
                        DataColumn(
                            label: SizedBox(
                          width: responsive.setWidth(5),
                          child: Text(
                            'الصورة',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: responsive
                                      .setTextSize(1), // Uses theme styling
                                ),
                          ),
                        )),
                        DataColumn(
                            label: SizedBox(
                          width: responsive.setWidth(10.5),
                          child: Text(
                            'الاسم',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: responsive.setTextSize(1),
                                ),
                          ),
                        )),
                        DataColumn(
                            label: SizedBox(
                          width: responsive.setWidth(12),
                          child: Text(
                            'الوصف',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: responsive
                                      .setTextSize(1), // Uses theme styling
                                ),
                          ),
                        )),
                        DataColumn(
                            label: SizedBox(
                          width: responsive.setWidth(3),
                          child: Text(
                            'السعر',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: responsive
                                      .setTextSize(1), // Uses theme styling
                                ),
                          ),
                        )),
                        DataColumn(
                            label: SizedBox(
                          width: responsive.setWidth(11),
                          child: Text(
                            'الفئة',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: responsive
                                      .setTextSize(1), // Uses theme styling
                                ),
                          ),
                        )),
                        DataColumn(
                            label: SizedBox(
                          width: responsive.setWidth(7),
                          child: Text(
                            'الإجراءات',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: responsive
                                      .setTextSize(1), // Uses theme styling
                                ),
                          ),
                        )),
                      ],
                      rows: instance<ProductCubit>()
                          .dataList
                          .map(
                            (product) => DataRow(
                              cells: [
                                DataCell(
                                  Image.network(
                                    product.image!,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                DataCell(SizedBox(
                                    width: responsive.setWidth(10),
                                    child: Text(
                                      product.title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontSize: responsive.setTextSize(1),
                                          ),
                                    ))),
                                DataCell(SizedBox(
                                    width: responsive.setWidth(12),
                                    child: Text(
                                      product.description!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontSize: responsive.setTextSize(
                                                1), // Uses theme styling
                                          ),
                                    ))),
                                DataCell(SizedBox(
                                    width: responsive.setWidth(3),
                                    child: Text(
                                      '${product.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontSize: responsive.setTextSize(
                                                1), // Uses theme styling
                                          ),
                                    ))),
                                DataCell(SizedBox(
                                    width: responsive.setWidth(12),
                                    child: Text(
                                      product.category!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
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
                                          icon: const Icon(Icons.edit,
                                              color: Colors.white),
                                          onPressed: () {
                                            _editProduct(context, product);
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete,
                                              color: Colors.white),
                                          onPressed: () {
                                            _deleteProduct(context, product);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _editProduct(BuildContext context, DataProductResponse product) {
    // هنا يمكنك إضافة نافذة تعديل المنتج
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
    // هنا يمكنك إضافة نافذة تأكيد الحذف
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
