import 'package:elminiawy/core/common/shared/shared_imports.dart';

class ProductListAndAddProductButton extends StatelessWidget {
  const ProductListAndAddProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Padding(
      padding: responsive.setPadding(top: 8, left: 2, right: 2),
      child: Row(
        children: [
          Text(
            context.translate(AppStrings.productsList),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: responsive.setTextSize(2), // Uses theme styling
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
                    context.translate(AppStrings.addProduct),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize:
                              responsive.setTextSize(1), // Uses theme styling
                        ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
