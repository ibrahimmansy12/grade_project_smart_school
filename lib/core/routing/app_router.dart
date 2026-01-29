// core/routing/app_router.dart
import 'package:flutter/material.dart';

class MyAppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
  //     case ERouts.mainScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => MultiBlocProvider(
  //           providers: [
  //             BlocProvider(lazy: false, create: (context) => MainCubit()),
  //             BlocProvider.value(
  //               value: getIt<FavoritesCubit>()..getfavoritesproducts(),
  //               child: FavoritesScreen(),
  //             ),
  //           ],
  //           child: MainScreen(),
  //         ),
  //       );
  //     case ERouts.seeallscreen:
  //       return MaterialPageRoute(
  //         builder: (context) => MultiBlocProvider(
  //           providers: [
  //             BlocProvider.value(value: getIt<ProductCubit>()),
  //             BlocProvider.value(
  //               value: getIt<FavoritesCubit>()..getfavoritesproducts(),
  //             ),
  //           ],
  //           child: SeeAllScreen(
  //             categoriesDataList:
  //                 getIt<ProductCubit>().categoriesDataList ?? [],
  //           ),
  //         ),
  //       );
  //     case ERouts.productScreen:
  //       var productDataDetails = settings.arguments as ProductDataDetails;
  //       return MaterialPageRoute(
  //         builder: (context) => BlocProvider.value(
  //           value: getIt<ProductCubit>(),
  //           child: ProductScreen(productDataDetails: productDataDetails),
  //         ),
  //       );
  //     /**
  // BlocProvider.value(
  //   value: getIt<CartCubit>(),
  //   child: CartScreen(),
  // ), */
  //     case ERouts.favoriteScreen:
  //       //var productDataDetails = settings.arguments as cart;
  //       return MaterialPageRoute(
  //         builder: (context) => BlocProvider.value(
  //           value: getIt<FavoritesCubit>(),
  //           child: FavoritesScreen(),
  //         ),
  //       );
  //     case ERouts.cartscreen:
  //       //var productDataDetails = settings.arguments as cart;
  //       return MaterialPageRoute(
  //         builder: (context) => BlocProvider.value(
  //           value: getIt<CartCubit>(),
  //           child: CartScreen(),
  //         ),
  //       );
  //     case ERouts.loginScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider(
  //           create: (context) => getIt<LoginCubit>(),
  //           child: LoginScreen(),
  //         ),
  //       );
  //     case ERouts.signupScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider(
  //           create: (context) => getIt<SignupCubit>(),
  //           child: SignupScreen(),
  //         ),
  //       );
      default:
        return null;
    }
  }
}
