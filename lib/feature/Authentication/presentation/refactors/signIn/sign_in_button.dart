import '../../../../../../core/common/shared/shared_imports.dart'; // Import shared utilities


class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
     
      listener: (context, state) {
        state.whenOrNull(
          error: (apiErrorModel) {
      
            ShowToast.showToastErrorTop(
                errorMessage: apiErrorModel.message!, context: context);
          },
          suceess: (authResponse) {
            if (authResponse.data!.role == "admin") {

              ShowToast.showToastSuccessTop(
                  message: authResponse.message!, context: context);
   
              AppLogin().storeDataThenNavigateToMap(authResponse);
            } else {
              ShowToast.showToastErrorTop(
                  errorMessage: context
                      .translate(AppStrings.thisAccountNotAccessInThisApp),
                  context: context);
            }
          },
        );
      },

      builder: (context, state) {
        final responsive = ResponsiveUtils(context);

        return CustomButton(
          width: responsive.responsiveValue(
              desktop: 30, tablet: 30, mobile: responsive.screenWidth),
          radius:
              responsive.responsiveValue(desktop: 0.8, tablet: 0.8, mobile: 2),

          onPressed: context.read<LoginBloc>().isButtonInVaildator
              ? () {
            
                  context.read<LoginBloc>().add(const UserLoginButton());
                }
              : null, 
          widget: LoadingButtonContent(
            defaultText: AppStrings.signIn,
            state: state,
          ),
        );
      },
    );
  }
}
