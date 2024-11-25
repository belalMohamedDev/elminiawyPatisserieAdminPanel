import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/sideMenu/logic/sideMenuCuibt/side_menu_cubit.dart';

class CancelAndSaveButton extends StatelessWidget {
  const CancelAndSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Row(
      children: [
        const Spacer(),
        CustomButton(
            color: ColorManger.brunLight,
            width: 7,
            radius: 0.8,
            onPressed: () {
              instance<SideMenuCubit>().onItemTap("Products");
            },
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.close,
                  color: ColorManger.white,
                  size: responsive.setIconSize(1.8),
                ),
                responsive.setSizeBox(width: 0.2),
                Text(
                  context.translate(AppStrings.cancel),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize:
                            responsive.setTextSize(1), // Uses theme styling
                      ),
                ),
              ],
            )),
        responsive.setSizeBox(width: 1),
        CustomButton(
            width: 7,
            radius: 0.8,
            onPressed: () {},
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.save_rounded,
                  color: ColorManger.white,
                  size: responsive.setIconSize(1.8),
                ),
                responsive.setSizeBox(width: 0.5),
                Text(
                  context.translate(AppStrings.save),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize:
                            responsive.setTextSize(1), // Uses theme styling
                      ),
                ),
              ],
            )),
      ],
    );
  }
}
