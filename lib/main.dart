import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/bloc_observer.dart';
import 'package:food_app/core/utils/resources/cache_helper.dart';
import 'package:food_app/core/utils/resources/constants.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/resources/theme_manager.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/chat/view_model/chat_cubit.dart';
import 'package:food_app/features/home/view/location_access.dart';
import 'package:food_app/features/home/view_model/home_cubit/home_cubit.dart';
import 'package:food_app/features/login/view_model/login_cubit.dart';
import 'package:food_app/features/onboarding/view/onboarding_view.dart';
import 'package:food_app/features/payment/view_model/payment_cubit.dart';
import 'package:food_app/features/search/view_model/search_cubit.dart';
import 'package:food_app/features/sign_up/view_model/sign_up_cubit.dart';
import 'features/home/view/home_view.dart';
import 'features/login/view/login_view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId') ?? '';

  bool seenOnboarding = CacheHelper.getData(key: 'seenOnboarding') ?? false;
  bool isLoggedIn = CacheHelper.getData(key: 'isLoggedIn') ?? false;
  bool isLocationAccessed = CacheHelper.getData(key: 'isLocationAccessed') ?? false;

  runApp(
      DevicePreview(
          enabled:false,
          builder: (BuildContext context){
            return  MyApp(
                startWidget: seenOnboarding ? (
                    isLoggedIn ? (isLocationAccessed?
                    const HomeView():const LocationAccess()) : const LoginView()):OnboardingView()
            );}
      ),

      );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SignUpCubit(),),
        BlocProvider(create: (BuildContext context) => LoginCubit(),),
        BlocProvider(create: (BuildContext context) => HomeCubit(),),
        BlocProvider(create: (BuildContext context) => SearchCubit(),),
        BlocProvider(create: (BuildContext context) => CartCubit()..getCartItems(),),
        BlocProvider(create: (BuildContext context) => PaymentCubit()..initializeState(),),
        BlocProvider(create: (BuildContext context) => ChatCubit(),),

      ],
      child: MaterialApp.router(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
        ),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.createRouter(startWidget),
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
      ),
    );
  }
}
