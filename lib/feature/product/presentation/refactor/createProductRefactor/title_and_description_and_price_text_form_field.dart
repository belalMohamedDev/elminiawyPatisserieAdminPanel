import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/product/presentation/refactor/createProductRefactor/text_field_row.dart';

class TitleAndDescriptionAndPriceTextFormField extends StatelessWidget {
  const TitleAndDescriptionAndPriceTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Column(
      children: [
        TextFieldRow(
          label: context.translate(AppStrings.titleInEnglish),
          hint: context.translate(AppStrings.pleaseEnterTitleInEnglish),
          controller: instance<ProductCubit>().productEnTitle,
          sizeBetweenItem: 15.2,
        ),
        responsive.setSizeBox(height: 2),
        TextFieldRow(
          label: context.translate(AppStrings.titleInArabic),
          hint: context.translate(AppStrings.pleaseEnterTitleInArabic),
          controller: instance<ProductCubit>().productArTitle,
          sizeBetweenItem: 15.8,
        ),
        responsive.setSizeBox(height: 2),
        TextFieldRow(
          label: context.translate(AppStrings.descriptionInEnglish),
          hint: context.translate(AppStrings.pleaseEnterDescriptionInEnglish),
          controller: instance<ProductCubit>().productEnDescription,
          sizeBetweenItem: 11,
          minLines: 2,
          maxLines: 6,
        ),
        responsive.setSizeBox(height: 2),
        TextFieldRow(
          label: context.translate(AppStrings.descriptionInArabic),
          hint: context.translate(AppStrings.pleaseEnterDescriptionInArabic),
          controller: instance<ProductCubit>().productArDescription,
          sizeBetweenItem: 11.5,
          minLines: 2,
          maxLines: 6,
        ),
        responsive.setSizeBox(height: 2),
        TextFieldRow(
          label: context.translate(AppStrings.price),
          hint: context.translate(AppStrings.pleaseEnterProductPrice),
          controller: instance<ProductCubit>().productPrice,
          sizeBetweenItem: 21,
        ),
      ],
    );
  }
}
