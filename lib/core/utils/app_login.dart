import '../../../../../core/common/shared/shared_imports.dart'; //
import 'dart:io';

class AppLogin {
  factory AppLogin() {
    return _instance;
  }

  AppLogin._();

  static final AppLogin _instance = AppLogin._();

  Future<void> storeDataThenNavigateToMap(AuthResponse authResponse,
      {bool isChangeUserPassword = false}) async {
    final navigatorState = instance<GlobalKey<NavigatorState>>().currentState;

    // Ensure the navigator state and authResponse data are not null
    if (navigatorState == null || authResponse.data == null) {
      // Handle error case or log the issue
      return;
    }

    final context = navigatorState.context;

    // Ensure necessary fields are not null before storing them
    if (authResponse.data!.phone != null) {
      await SharedPrefHelper.setData(
          PrefKeys.userPhone, authResponse.data!.phone!);
    }
    if (authResponse.data!.name != null) {
      await SharedPrefHelper.setData(
          PrefKeys.userName, authResponse.data!.name!);
    }
    if (authResponse.data!.email != null) {
      await SharedPrefHelper.setData(
          PrefKeys.userEmail, authResponse.data!.email!);
    }
    if (authResponse.data!.sId != null) {
      await SharedPrefHelper.setData(PrefKeys.userId, authResponse.data!.sId!);
    }
    if (authResponse.accessToken != null) {
      await SharedPrefHelper.setData(
          PrefKeys.accessToken, authResponse.accessToken!);
    }
    if (authResponse.data!.refreshToken != null) {
      if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
        await SharedPrefHelper.setData(
            PrefKeys.refreshToken, authResponse.data!.refreshToken!);
      }
    }

    if (context.mounted) {
      context.pushReplacementNamed(Routes.sideMenu);
    }
  }
}
