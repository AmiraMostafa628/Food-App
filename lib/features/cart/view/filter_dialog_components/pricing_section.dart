import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pricing'.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: ColorManager.labelColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: CartCubit.get(context).itemSize.map((item) {
                final int index = CartCubit.get(context).itemSize.indexOf(item);
                final bool isSelected =
                    CartCubit.get(context).selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    CartCubit.get(context).selectFoodSize(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: CircleAvatar(
                      radius: 27,
                      backgroundColor: isSelected
                          ? ColorManager.primaryColor
                          : ColorManager.fillTextFieldColor,
                      child: Text(
                        item,
                        style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: isSelected
                              ? ColorManager.white
                              : ColorManager.textColor,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}