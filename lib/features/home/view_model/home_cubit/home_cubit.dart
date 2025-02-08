import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/models/restaurant_model.dart';
import 'package:food_app/features/home/view/home_cart.dart';
import 'package:food_app/features/home/view/home_view_body.dart';
import 'package:food_app/features/home/view_model/home_cubit/home_states.dart';
import 'package:food_app/features/my_orders/view/my_orders_view.dart';
import 'package:food_app/features/profile/view/profile_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() :super(HomeInitialStates());

  static HomeCubit get(context) => BlocProvider.of(context);

  final List<RestaurantModel> restaurantModel = [
    RestaurantModel(
        restaurantName: 'rose garden restaurant',
        restaurantCategories: 'Burger - Chicken - Riche - Wings'),
    RestaurantModel(
        restaurantName: 'Pansi Restaurant',
        restaurantCategories:
        'Classic Lasagna - italian Riche - Ravioli - Tiramisu'),
    RestaurantModel(
        restaurantName: 'Cafenio Coffee Club',
        restaurantCategories: 'Coffee - Mocha - Espresso - Cappuccino'),
  ];
  final List<String> title = ['All', 'Hot Dog', 'Burger', 'Pizza'];

  int selectedIndex = 0;
  void selectCategory(int index) {
    selectedIndex = index;
    emit(ChangeIndexSuccessStates());
  }


  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavBarStates());
  }
  List <Widget> screens =[
    HomeViewBody(),
    const MyOrdersView(),
    const HomeCart(),
    const ProfileView()
  ];

  Future<void> requestLocationPermission() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isDenied) {
      // The user denied the permission, show a dialog or take another action.
    } else if (permission.isGranted) {
      LocationSettings locationSettings =
      AndroidSettings( accuracy: LocationAccuracy.high, distanceFilter: 10, );
      Position position =
      await Geolocator.getCurrentPosition( locationSettings: locationSettings, );
      if (kDebugMode) {
        print('Current Location: ${position.latitude}, ${position.longitude}');
      }
      emit(AccessLocationSuccessStates());

    }
  }


}