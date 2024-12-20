import 'package:device_preview/device_preview.dart';

import '../../../../../core/common/shared/shared_imports.dart'; //

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize environment variables
  await EnvVariable.instance.init();

  await SharedPrefHelper.getInstancePreferences().whenComplete(
    () async {
      await AppInitialRoute().getStoreDataAndCheckInitialRoute();
    },
  );

  //debugPaintSizeEnabled = true;

  await initAppModule();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorManger.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}
