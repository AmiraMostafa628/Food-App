import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.totalPrice,
  });

  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'total:'.toUpperCase(),
                    style:
                    Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 14,
                      color: ColorManager.restaurantCategoriesColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '\$$totalPrice',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: ColorManager.restaurantTitleColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              CustomButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kConfirmPayment);
                  },
                  text: 'Pay & Confirm'),
              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}