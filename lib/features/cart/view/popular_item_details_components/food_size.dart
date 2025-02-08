import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';

class FoodSize extends StatelessWidget {
  const FoodSize({super.key, required this.selectedSize});

  final Function(String?) selectedSize;

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CartCubit,CartStates>(
      builder:(context,state){
        return Row(
          children: [
            Text('Size:',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: ColorManager.labelColor
              ),
            ),
            const SizedBox(width: 12.0,),
            Row(
              children: CartCubit.get(context).foodSize.map((item) {
                final int index = CartCubit.get(context).foodSize.indexOf(item);
                final bool isSelected = CartCubit.get(context).selectedIndex == index;
                return GestureDetector(
                  onTap: (){
                    CartCubit.get(context).selectFoodSize(index);
                    selectedSize(item);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: CircleAvatar(
                      radius: 27,
                      backgroundColor: isSelected?ColorManager.primaryColor: ColorManager.fillTextFieldColor,
                      child: Text(item,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: isSelected?ColorManager.white:ColorManager.textColor,
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