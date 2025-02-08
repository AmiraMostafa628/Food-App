import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/responsive_value.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rating'.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: ColorManager.labelColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    CartCubit.get(context).selectRating(index);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: getRatingPadding(context)),
                    child: CircleAvatar(
                      radius: 27,
                      backgroundColor: ColorManager.white,
                      child: CartCubit.get(context).changeIcon(index),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}

