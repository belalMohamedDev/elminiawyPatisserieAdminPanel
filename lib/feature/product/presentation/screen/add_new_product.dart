import 'package:elminiawy/core/common/shared/shared_imports.dart';

class CreateNewProductScreen extends StatelessWidget {
  const CreateNewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Container(
      decoration: BoxDecoration(
          color: ColorManger.white,
          borderRadius: BorderRadius.circular(responsive.setBorderRadius(1.5))),
      child: Padding(
        padding: responsive.setPadding(right: 3, top: 4),
        child: Column(
          children: [
            Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  IconlyBold.closeSquare,
                  color: ColorManger.brun,
                  size: responsive.setIconSize(3),
                ))
          ],
        ),
      ),
    );
  }
}
