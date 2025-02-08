
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_text_form_field.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarOfCartView extends StatelessWidget {
  const BottomNavBarOfCartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
        ),
      ),
      child: BlocBuilder<CartCubit,CartStates>(
        builder: (context,state){
          return IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Delivery Address'.toUpperCase(),
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontSize: 14,
                            color: ColorManager.restaurantCategoriesColor
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Edit'.toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: ColorManager.primaryColor,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorManager.primaryColor
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  CustomTextFormField(
                      text: '2118 Thornridge Cir. Syracuse',
                      color:  ColorManager.fillTextFieldColor,
                      textEditingController: TextEditingController()),
                  const SizedBox(height: 25.0,),
                  Row(
                    children: [
                      Text('total:'.toUpperCase(),
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 14,
                          color: ColorManager.restaurantCategoriesColor,

                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      Text(
                        '\$${CartCubit.get(context).totalPrice.toString()}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: ColorManager.restaurantTitleColor,
                        ),
                      ),
                      const Spacer(),
                      Text("breakdown".toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: ColorManager.primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios,
                        size: 14,
                        color: ColorManager.iconColor,),
                    ],
                  ),
                  const SizedBox(height: 25.0,),
                  CustomButton(
                      onPressed: (){
                        GoRouter.of(context).push(AppRouter.kPaymentView,extra: CartCubit.get(context).totalPrice);
                      },
                      text: 'Place Order'),
                  const SizedBox(height: 25.0,),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}