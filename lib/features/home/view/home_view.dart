import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/cache_helper.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/home/view/show_offer_dialog.dart';
import 'package:food_app/features/home/view_model/home_cubit/home_cubit.dart';
import 'package:food_app/features/home/view_model/home_cubit/home_states.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';


class HomeView extends StatelessWidget {
 const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    _checkSeenOffer(context);
    CartCubit().getCartItems();
    return BlocBuilder<HomeCubit,HomeStates>(
      builder: (context,state){
         HomeCubit cubit = HomeCubit.get(context);
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: WaterDropNavBar(
                barItems: [
                  BarItem(
                      filledIcon:Icons.grid_view_rounded,
                      outlinedIcon: Icons.grid_view_outlined),
                  BarItem(
                      filledIcon:Icons.filter_list_outlined,
                      outlinedIcon: Icons.filter_list_rounded),
                  BarItem(
                      filledIcon:Icons.shopping_cart,
                      outlinedIcon: Icons.shopping_cart_checkout_outlined),
                  BarItem(
                      filledIcon:Icons.person,
                      outlinedIcon: Icons.person_2_outlined)
                ],
                selectedIndex: cubit.currentIndex,
                waterDropColor: ColorManager.primaryColor,
                inactiveIconColor: ColorManager.restaurantCategoriesColor,
                onItemSelected: (index){
                  cubit.changeIndex(index);
                }),

          ),
        );
      },
    );
  }

  Future<void> _checkSeenOffer(BuildContext context) async {
    bool seenOffer = CacheHelper.getData(key: 'seenOffer') ?? false;
    if (!seenOffer) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showCustomDialog(context);
      });
      CacheHelper.saveData(key: 'seenOffer', value: true);
    }
  }
}
