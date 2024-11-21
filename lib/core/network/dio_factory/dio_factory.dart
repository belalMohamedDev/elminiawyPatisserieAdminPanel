import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import '../../../../../core/common/shared/shared_imports.dart'; //

const String applicationJson = 'application/json';
const String contentType = 'contentType';
const String accept = 'Accept';
const String authorization = 'Authorization';

class DioFactory {
  static Dio? dio;

  DioFactory._();

  static Dio getDio() {
    Duration timeOut = const Duration(milliseconds: ApiConstants.apiTimeOut);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.receiveDataWhenStatusError = true;

      dio?.interceptors.add(TokenInterceptor(dio!));

      _addCookieManager();

      if (!kReleaseMode) {
        // It's debug mode so print app logs
        addDioInterceptor();
      }

      return dio!;
    } else {
      return dio!;
    }
  }

  static void _addCookieManager() {
    if (kIsWeb) return;

    dio?.interceptors.add(CookieManager(CookieJar()));
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
