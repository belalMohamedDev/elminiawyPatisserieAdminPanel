import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/core/common/sharedWidget/custom_dropdown_button_form_field.dart';

class SubCategoryRow extends StatelessWidget {
  const SubCategoryRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Row(
      children: [
        Text(
          context.translate(AppStrings.subCategory),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: responsive.setTextSize(1.5), // Uses theme styling
              ),
        ),
        responsive.setSizeBox(width: 16.2),
        responsive.setSizeBox(
            height: 5,
            width: 40,
            child: const CustomDropdownButtonFormField(
              value: AppStrings.subCategory,
              items: ["", ""],
            )),
      ],
    );
  }
}
