import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/core/utils/shared_widgets/max_grey_container.dart';
import 'package:food_app/features/payment/view_model/payment_cubit.dart';
import 'package:food_app/features/payment/view_model/payment_states.dart';
import 'package:go_router/go_router.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:  Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MaxGreyContainer(
                    height: 208,
                    width: 230,
                    borderRadius: 30,
                  ),
                  const SizedBox(height: 20,),
                  Text('Congratulations!',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0,),
                  Text('You successfully made a payment,\nenjoy our service!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: ColorManager.greyTextColor,
                      )),
                ],
              ),
            ),
           BlocBuilder<PaymentCubit,PaymentStates>(
               builder: (context,state){
                 return  CustomButton(
                     onPressed: (){

                       GoRouter.of(context).push(AppRouter.kTrackOrder);
                     },
                     text: 'Track Order');
               })
          ],
        ),
      ),
    );
  }
}
