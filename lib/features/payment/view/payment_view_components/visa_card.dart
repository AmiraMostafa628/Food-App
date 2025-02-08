import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/payment/view_model/payment_cubit.dart';
import 'package:food_app/features/payment/view_model/payment_states.dart';

class VisaCard extends StatelessWidget {
  const VisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit,PaymentStates>(
      builder:(context,state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: PaymentCubit.get(context).cardModel.map((item){
            return IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.fillTextFieldColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Visa Card',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.labelColor,

                              ),
                            ),
                            const SizedBox(height: 10.0,),
                            Row(
                              children: [
                                SvgPicture.asset(AssetsManager.visa,height: 18,width: 28,),
                                const SizedBox(width: 10.0,),
                                Center(
                                  child: Text('*' * item.cardNumber.length,
                                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                        color: ColorManager.labelColor
                                    ),
                                  ),
                                ),
                                Text(item.cvcNumber,
                                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                      color: ColorManager.labelColor
                                  ),
                                ),


                              ],
                            ),


                          ],
                        ),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      } ,
    );
  }

}