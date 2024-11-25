import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/product/presentation/refactor/createProductRefactor/cancel_and_save_button.dart';
import 'package:elminiawy/feature/product/presentation/refactor/createProductRefactor/category_row.dart';
import 'package:elminiawy/feature/product/presentation/refactor/createProductRefactor/image_row.dart';
import 'package:elminiawy/feature/product/presentation/refactor/createProductRefactor/sub_category_row.dart';
import 'package:elminiawy/feature/product/presentation/refactor/createProductRefactor/title_and_description_and_price_text_form_field.dart';

class CreateNewProductScreen extends StatelessWidget {
  const CreateNewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Container(
        decoration: BoxDecoration(
            color: ColorManger.white,
            borderRadius:
                BorderRadius.circular(responsive.setBorderRadius(1.5))),
        child: Padding(
            padding: responsive.setPadding(right: 10, top: 4, left: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CancelAndSaveButton(),
                responsive.setSizeBox(height: 5),
                const TitleAndDescriptionAndPriceTextFormField(),
                responsive.setSizeBox(height: 2),
                const CategoryRow(),
                responsive.setSizeBox(height: 2),
                const SubCategoryRow(),
                responsive.setSizeBox(height: 2),
                const ImageRow(),
              ],
            )));
  }
}
