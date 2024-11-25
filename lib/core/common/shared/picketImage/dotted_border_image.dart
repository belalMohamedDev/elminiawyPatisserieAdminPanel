import 'package:dotted_border/dotted_border.dart';
import 'package:elminiawy/core/common/shared/shared_imports.dart';

class DottedBorderImage extends StatelessWidget {
  final Uint8List? image;
  final bool isRegisterComplete;
  const DottedBorderImage({
    super.key,
    this.image,
    this.isRegisterComplete = false,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(responsive.setBorderRadius(1.5)),
      dashPattern: const [6, 3],
      color: image != null ? ColorManger.redError : ColorManger.brownLight,
      strokeWidth: 2,
      child: SizedBox(
        height: responsive.setHeight(16),
        width: isRegisterComplete ? double.infinity : responsive.setWidth(40),
        child: image != null
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(responsive.setBorderRadius(0.2))),
                  image: DecorationImage(
                      fit: BoxFit.contain, image: MemoryImage(image!)),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    IconlyBold.camera,
                    color: Colors.grey.shade500,
                    size: responsive.setIconSize(isRegisterComplete ? 13 : 3),
                  ),
                  responsive.setSizeBox(height: 1.5),
                  Text(context.translate(AppStrings.uploadProfilePicture),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: responsive.setTextSize(1),
                          ))
                ],
              ),
      ),
    );
  }
}
