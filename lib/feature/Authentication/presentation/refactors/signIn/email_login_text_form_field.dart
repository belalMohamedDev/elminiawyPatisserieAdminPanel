import '../../../../../../core/common/shared/shared_imports.dart'; // Import barrel file for shared utilities

class EmailLoginTextFormField extends StatelessWidget {
  const EmailLoginTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SizedBox(
          width: responsive.responsiveValue(
              desktop: responsive.setWidth(30),
              tablet: responsive.setWidth(30),
              mobile: responsive.screenWidth),
          child: TextFormField(
            style: TextStyle(
              fontSize: responsive.responsiveTextSize(
                  desktop: responsive.setTextSize(1.2),
                  tablet: responsive.setTextSize(1.2),
                  mobile: responsive.setTextSize(3)),
            ),
            onChanged: (value) =>
                context.read<LoginBloc>().add(UserLoginEmailAddress(value)),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: context.read<LoginBloc>().userLoginEmailAddress,
            autofillHints: const [
              AutofillHints.email,
            ],
            decoration: InputDecoration(
              prefixIcon: Icon(
                IconlyBroken.message,
                size: responsive.setIconSize(responsive.responsiveValue(
                    desktop: 2, tablet: 2, mobile: 5.5)),
              ),
              hintText: context.translate(AppStrings.emailExample),
              errorText: state.whenOrNull(
                userLoginEmailAddress: (value) {
                  return value.isNotEmpty ? value : null;
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
