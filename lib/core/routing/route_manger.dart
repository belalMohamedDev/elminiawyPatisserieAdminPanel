import 'package:elminiawy/feature/sideMenu/logic/sideMenuCuibt/side_menu_cubit.dart';

import '../../../../core/common/shared/shared_imports.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => instance<LoginBloc>(),
              ),
            ],
            child: const LoginView(),
          ),
        );

      case Routes.address:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<UserAddressCubit>(),
            child: const UserAddressView(),
          ),
        );

      case Routes.addNewAddress:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: instance<UserAddressCubit>(),
              ),
              BlocProvider.value(
                value: instance<PaymentCubit>(),
              ),
              BlocProvider.value(
                value: instance<MapCubit>(),
              ),
            ],
            child: const AddNewAddressScreen(),
          ),
        );

      case Routes.map:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<MapCubit>(),
            child: const MapScreen(),
          ),
        );

      case Routes.accountInfomation:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => instance<AccountInformationCubit>(),
              ),
            ],
            child: const AccountInfomation(),
          ),
        );

      case Routes.changeMyEmail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<ChangeEmailAddressCubit>(),
            child: const ChangeEmailScreen(),
          ),
        );
      case Routes.changeMyPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<ChangeMyPasswordCubit>(),
            child: const ChangePasswordScreen(),
          ),
        );

      // case Routes.newProduct:
      //   return MaterialPageRoute(
      //     builder: (_) => MultiBlocProvider(
      //       providers: [
      //         BlocProvider.value(
      //           value: instance<CartCubit>(),
      //         ),
      //         BlocProvider.value(
      //           value: instance<ProductCubit>(),
      //         ),
      //         BlocProvider.value(
      //           value: instance<WishListCubit>(),
      //         ),
      //       ],
      //       child: const NewProductView(),
      //     ),
      //   );

      case Routes.notification:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<UserNotificationCubit>(),
            child: const UserNotificationScreen(),
          ),
        );

      case Routes.orderPlaced:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<PaymentCubit>(),
            child: const OrderPlaced(),
          ),
        );
      case Routes.orderDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<PaymentCubit>(),
            child: const OrderDetails(),
          ),
        );

      case Routes.myOrder:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: instance<PaymentCubit>(),
                  child: const MyOrdersScreen(),
                ));

      case Routes.sideMenu:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: instance<ProductCubit>(),
              ),
              BlocProvider.value(
                value: instance<SideMenuCubit>(),
              ),
              BlocProvider.value(
                value: instance<CategoryCubit>(),
              ),
            ],
            child: const SideMenuScreen(),
          ),
        );

      case Routes.wishList:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: instance<CartCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<ProductCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<WishListCubit>(),
                    ),
                  ],
                  child: const WishListView(),
                ));

      case Routes.cart:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: instance<UserAddressCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<CartCubit>(),
                    ),
                  ],
                  child: const CartView(),
                ));

      case Routes.search:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: instance<SearchBloc>(),
                  child: const SearchView(),
                ));

      case Routes.noRoute:
        return MaterialPageRoute(builder: (_) => const RouteStatesScreen());

      case Routes.shippingAddress:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: instance<MapCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<PaymentCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<UserAddressCubit>(),
                    ),
                  ],
                  child: const ShippingAddress(),
                ));

      case Routes.shippingPayment:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: instance<PaymentCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<CartCubit>(),
                    ),
                  ],
                  child: const PaymentScreen(),
                ));

      case Routes.shippingReviewScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: instance<PaymentCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<CartCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<UserAddressCubit>(),
                    ),
                  ],
                  child: const ReviewPaymentScreen(),
                ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(context.translate(AppStrings.noRouteFound)),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text(context.translate(AppStrings.noRouteFound)),
          ),
        ),
      ),
    );
  }
}
