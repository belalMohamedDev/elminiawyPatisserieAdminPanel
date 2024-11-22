import '../../../../../core/common/shared/shared_imports.dart'; //
import 'dart:io';

class TokenInterceptor extends Interceptor {
  final Dio dio;
  final navigatorKey = GlobalKey<NavigatorState>();

  TokenInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Obtain the access token
    String? accessToken = SharedPrefHelper.getString(PrefKeys.accessToken);

    String? language =
        SharedPrefHelper.getString(PrefKeys.prefsLanguage).isEmpty
            ? 'en'
            : SharedPrefHelper.getString(PrefKeys.prefsLanguage);

    options.headers["Accept"] = "application/json";

    options.headers["Authorization"] = "Bearer $accessToken";

    options.headers["lang"] = language;

    return handler.next(options);
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

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      String? refreshToken;

      if (Platform.isAndroid || Platform.isIOS) {
        refreshToken =
           SharedPrefHelper.getString(PrefKeys.refreshToken);
      } else {
        final cookies = err.requestOptions.headers['cookie']?.toString();
        if (cookies != null) {
          final cookieMap = _parseCookies(cookies);
          refreshToken = cookieMap['refreshToken'];
        }
      }

      if (refreshToken != null) {
        try {
          final response = await dio.post(
            ApiConstants.refreshToken,
            data: {'refreshToken': refreshToken},
            options: Options(headers: {"Content-Type": "application/json"}),
          );

          final newAccessToken = response.data['accessToken'];

          if (Platform.isAndroid || Platform.isIOS) {
            await SharedPrefHelper.setData(
                PrefKeys.accessToken, newAccessToken);
          } else {
            dio.options.headers['cookie'] =
                'accessToken=$newAccessToken; path=/; HttpOnly;';
          }

          final opts = Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers
              ..["Authorization"] = "Bearer $newAccessToken",
          );
          final cloneReq = await dio.request(
            err.requestOptions.path,
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );

          return handler.resolve(cloneReq);
        } catch (e) {
          _showSessionExpiredMessage();
          return handler.reject(err);
        }
      } else {
        _showSessionExpiredMessage();
        return handler.reject(err);
      }
    } else if (err.response?.statusCode == 500) {
      try {
        final cloneReq = await dio.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );

        return handler.resolve(cloneReq);
      } catch (e) {
        return handler.reject(err);
      }
    }

    // Forward other errors
    return handler.next(err);
  }

  void _showSessionExpiredMessage() {
    final context = navigatorKey.currentState?.context;

    if (context != null) {
      ShowToast.showToastErrorTop(
          errorMessage: context.translate(AppStrings.sessionExpired),
          context: context);

      // Show session expired message
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        Routes.loginRoute,
        (Route<dynamic> route) => false,
        arguments: context.translate(AppStrings.sessionExpired),
      );
    }
  }
}
