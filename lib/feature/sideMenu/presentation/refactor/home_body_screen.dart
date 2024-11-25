import 'package:elminiawy/core/common/shared/shared_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Container(
      decoration: BoxDecoration(
          color: ColorManger.white,
          borderRadius: BorderRadius.circular(responsive.setBorderRadius(1.5))),
    );
  }
}
