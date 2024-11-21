import '../../../../../core/common/shared/shared_imports.dart'; //

class AppInitialRoute {
  factory AppInitialRoute() {
    return _instance;
  }

  AppInitialRoute._();

  static final AppInitialRoute _instance = AppInitialRoute._();

  static bool isLoggedInUser = false;

  getStoreDataAndCheckInitialRoute() async {
    String userToken =
        await SharedPrefHelper.getSecuredString(PrefKeys.refreshToken);

    if (userToken.isNullOrEmpty()) {
      const cookies =
          ''; 
      if (cookies.isNotEmpty) {
        final cookieMap = _parseCookies(cookies);
        userToken = cookieMap['refreshToken'] ??
            ''; 
      }
    }

    if (!userToken.isNullOrEmpty()) {
      isLoggedInUser = true;
    } else {
      isLoggedInUser = false;
    }
  }

  Map<String, String> _parseCookies(String cookies) {
    final cookieMap = <String, String>{};
    cookies.split(';').forEach((cookie) {
      final parts = cookie.split('=');
      if (parts.length == 2) {
        cookieMap[parts[0].trim()] = parts[1].trim();
      }
    });
    return cookieMap;
  }
}
