import 'package:elminiawy/core/common/shared/picketImage/dotted_border_image.dart';
import 'package:elminiawy/core/common/shared/shared_imports.dart';

class ImageRow extends StatelessWidget {
  const ImageRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.translate(AppStrings.image),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: responsive.setTextSize(1.5), // Uses theme styling
                  ),
            ),
            responsive.setSizeBox(width: 20),
            InkWell(
              onTap: () async {
                await instance<ProductCubit>().pickImage();
              },
              child: DottedBorderImage(
                image: instance<ProductCubit>().image,
              ),
            ),
          ],
        );
      },
    );
  }
}
