import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/features/home/view/home_cart_view.dart';

class HomeCart extends StatelessWidget {
  const HomeCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const ArrowBackButton(),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Cart',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                    color: ColorManager.restaurantTitleColor,
                    fontSize: 17,

                  ),
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
            const Expanded(child: BuildHomeCartItem()),
          ],
        ),
      ),
    );
  }
}

