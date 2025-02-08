import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/features/cart/view/build_cart_item.dart';
import 'package:food_app/features/cart/view/cart_view_bottom_nav_bar.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.restaurantTitleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  ArrowBackButton(
                    buttonColor:ColorManager.white.withAlpha(26),
                    iconColor:ColorManager.white,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Cart',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorManager.white),
                  ),
                  const Spacer(),
                  Text(
                    'Edit Items'.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: ColorManager.primaryColor,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorManager.primaryColor
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Expanded(child: BuildCartItem()),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  const BottomNavBarOfCartView(),
    );
  }
}



