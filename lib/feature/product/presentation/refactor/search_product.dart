import 'package:elminiawy/core/common/shared/shared_imports.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Padding(
      padding: responsive.setPadding(right: 2, bottom: 5),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: responsive.setHeight(5.5),
          width: responsive.setWidth(25),
          child: TextFormField(
            onChanged: (value) =>
                context.read<SearchBloc>().add(SearchEvent.searchText(value)),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: context.translate(AppStrings.findYourPatisserie),
                prefixIcon: Icon(IconlyBroken.search,
                    size: responsive.setIconSize(2), color: ColorManger.white),
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
    );
  }
}
