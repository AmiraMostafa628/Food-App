import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';

class IngredientInfo extends StatelessWidget {
  const IngredientInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartStates>(
        builder: (context,state){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ingredient'.toUpperCase(),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: ColorManager.labelColor
                ),
              ),
              const SizedBox(height: 15.0,),
              Wrap(
                spacing: 15.0,
                runSpacing: 10.0,
                children: CartCubit.get(context).inGradientItems.map((item) {
                  return Column(
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundColor:ColorManager.lightOrange3,
                          child: SvgPicture.asset(item.icon,
                            width: 24,
                            height: 24,
                            colorFilter: const ColorFilter.mode(ColorManager.orange,
                                BlendMode.srcIn),)
                      ),
                      const SizedBox(height: 10.0,),
                      Text(item.title,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorManager.inGradientTextColor,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          );
        });
  }
}