import 'package:elminiawy/feature/category/model/repository/repositry.dart';
import 'package:elminiawy/feature/sideMenu/logic/sideMenuCuibt/side_menu_cubit.dart';

import '../../../../core/common/shared/shared_imports.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await Future.wait([
    _initAppModule(),
    _inithome(),
    _initPlaces(),
    _initLogin(),
    _initProduct(),
    _initWishList(),
    _initLogOut(),
    _initAddress(),
    _initProductBasedOnCategory(),
    _initCart(),
    _initAccoutInformation(),
    _initChangeEmailAddress(),
    _initChangeMyPassword(),
    _initPayment(),
    _initNotification(),
    _initSearch(),
    _initSignInWithGoogleAndApple(),
    _initSideMenu(),
    _initCategory()
  ]);
}

Future<void> _initAppModule() async {
  // app module ,its a module where we put all generic dependencies

  await ScreenUtil.ensureScreenSize();

  Bloc.observer = AppBlocObserver();

  final navigatorKey = GlobalKey<NavigatorState>();

  // Dio & ApiService

  Dio dio = DioFactory.getDio();

  instance
    ..registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory<AppLogicCubit>(() => AppLogicCubit());
}

Future<void> _initSideMenu() async {
  // //home repository
  instance.registerLazySingleton<SideMenuCubit>(() => SideMenuCubit());
}

Future<void> _inithome() async {
  // //home repository
  instance
    ..registerLazySingleton<HomeRepositoryImplement>(
        () => HomeRepositoryImplement(
              instance(),
            ))
    ..registerFactory<BannerCubit>(() => BannerCubit(
          instance(),
        ));
}

Future<void> _initPlaces() async {
  final places = GoogleMapsPlaces(apiKey: EnvVariable.instance.mapKey);

  instance.registerLazySingleton<GoogleMapsPlaces>(() => places);
}

Future<void> _initLogin() async {
  instance.registerFactory<LoginBloc>(() => LoginBloc(
        instance(),
      ));
}

Future<void> _initCategory() async {
  instance
    ..registerLazySingleton<CategoryRepositoryImplement>(
        () => CategoryRepositoryImplement(
              instance(),
            ))
    ..registerLazySingleton<CategoryCubit>(() => CategoryCubit(
          instance(),
        ));
}

Future<void> _initSignInWithGoogleAndApple() async {
  instance.registerLazySingleton<AuthenticationRepositoryImplement>(
      () => AuthenticationRepositoryImplement(instance()));
}

Future<void> _initProduct() async {
  instance.registerLazySingleton<ProductRepository>(
      () => ProductRepository(instance()));
  instance.registerLazySingleton<ProductCubit>(() => ProductCubit(
        instance(),
      ));
}

Future<void> _initWishList() async {
  instance
    ..registerLazySingleton<WishListRepositoryImplement>(
        () => WishListRepositoryImplement(instance()))
    ..registerLazySingleton<WishListCubit>(() => WishListCubit(
          instance(),
        ));
}

Future<void> _initLogOut() async {
  instance
    ..registerLazySingleton<LogOutRepository>(() => LogOutRepository(
          instance(),
        ))
    ..registerFactory<LogOutCubit>(() => LogOutCubit(
          instance(),
        ));
}

Future<void> _initAddress() async {
  instance
    ..registerLazySingleton<UserAddressRepositoryImplement>(
        () => UserAddressRepositoryImplement(instance()))
    ..registerLazySingleton<MapCubit>(() => MapCubit(
          instance(),
          instance(),
        ))
    ..registerLazySingleton<UserAddressCubit>(() => UserAddressCubit(
          instance(),
        ));
}

Future<void> _initProductBasedOnCategory() async {
  instance
    ..registerLazySingleton<GetProductBasedOnCategoryRepository>(
        () => GetProductBasedOnCategoryRepository(instance()))
    ..registerFactory<ProductBasedOnCategoryCubit>(
        () => ProductBasedOnCategoryCubit(
              instance(),
            ));
}

Future<void> _initCart() async {
  instance
    ..registerLazySingleton<CartRepositoryImplement>(
        () => CartRepositoryImplement(instance()))
    ..registerLazySingleton<CartCubit>(() => CartCubit(
          instance(),
        ));
}

Future<void> _initAccoutInformation() async {
  instance
    ..registerLazySingleton<AccountInformationRepositoryImplement>(
        () => AccountInformationRepositoryImplement(instance()))
    ..registerFactory<AccountInformationCubit>(() => AccountInformationCubit(
          instance(),
        ));
}

Future<void> _initChangeEmailAddress() async {
  instance
    ..registerLazySingleton<ChangeEmailAddressRepository>(
        () => ChangeEmailAddressRepository(instance()))
    ..registerFactory<ChangeEmailAddressCubit>(() => ChangeEmailAddressCubit(
          instance(),
        ));
}

Future<void> _initChangeMyPassword() async {
  instance
    ..registerLazySingleton<ChangeMyPasswordRepository>(
        () => ChangeMyPasswordRepository(instance()))
    ..registerFactory<ChangeMyPasswordCubit>(() => ChangeMyPasswordCubit(
          instance(),
        ));
}

Future<void> _initPayment() async {
  instance
    ..registerLazySingleton<OrderRepositoryImplement>(
        () => OrderRepositoryImplement(instance()))
    ..registerLazySingleton<PaymentCubit>(() => PaymentCubit(instance()));
}

Future<void> _initNotification() async {
  instance
    ..registerLazySingleton<UserNotificationRepositoryImplement>(
        () => UserNotificationRepositoryImplement(instance()))
    ..registerFactory<UserNotificationCubit>(
        () => UserNotificationCubit(instance()));
}

Future<void> _initSearch() async {
  instance
    ..registerLazySingleton<SearchInProductRepository>(
        () => SearchInProductRepository(instance()))
    ..registerLazySingleton<SearchBloc>(() => SearchBloc(instance()));
}
