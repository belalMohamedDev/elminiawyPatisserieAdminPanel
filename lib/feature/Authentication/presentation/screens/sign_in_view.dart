import '../../../../../core/common/shared/shared_imports.dart'; // Import barrel file for shared utilities

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: responsive.setPadding(
                  left: 5.5, right: 5, top: 25, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadlineTextAuthScreen(
                    titleText: AppStrings.welcomeBack,
                    subTitleText: AppStrings.toGetStartedSignInToYourAccount,
                  ),
                  SizedBox(height: responsive.setHeight(6)),
                  const EmailLoginTextFormField(),
                  SizedBox(
                    height: responsive.setHeight(2),
                  ),
                  const PasswordLoginTextFormField(),
                  SizedBox(
                    height: responsive.setHeight(3.5),
                  ),
                  const SignInButton(),
                ],
              ),
            ),
          ),
          Responsive(
            tablet: Padding(
              padding: responsive.setPadding(right: 5, bottom: 8),
              child: Image.asset(
                ImageAsset.shoppingBag,
              ),
            ),
            desktop: Padding(
              padding: responsive.setPadding(right: 5, bottom: 8),
              child: Image.asset(ImageAsset.shoppingBag),
            ),
          )
        ],
      ),
    );
  }
}
