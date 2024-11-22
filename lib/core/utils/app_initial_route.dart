import '../../../../../core/common/shared/shared_imports.dart'; //

class AppInitialRoute {
  factory AppInitialRoute() {
    return _instance;
  }

  AppInitialRoute._();

  static final AppInitialRoute _instance = AppInitialRoute._();

  static bool isLoggedInUser = false;

  getStoreDataAndCheckInitialRoute() async {
    String userId = SharedPrefHelper.getString(PrefKeys.userId);

    if (!userId.isNullOrEmpty()) {
      isLoggedInUser = true;
    } else {
      isLoggedInUser = false;
    }
  }
}
