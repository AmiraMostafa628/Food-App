import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/features/payment/view/add_card_button.dart';
import 'package:food_app/features/payment/view/card_type_section.dart';
import 'package:food_app/features/payment/view/payment_view_components/bottom_nav_bar.dart';
import 'package:food_app/features/payment/view_model/payment_cubit.dart';
import 'package:food_app/features/payment/view_model/payment_states.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.totalPrice});

  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PaymentCubit, PaymentStates>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const ArrowBackButton(),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Payment',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorManager.restaurantTitleColor,
                                    fontSize: 17,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    const CardTypeSection(),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Container(
                      height: 270,
                      decoration: BoxDecoration(
                        color: ColorManager.fillTextFieldColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: 170,
                                  height: 120,
                                  child: SvgPicture.asset(AssetsManager.masterCardImage),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0,bottom: 10.0,top: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(AssetsManager.masterCardDecoration),
                                      const SizedBox(height: 20.0,),
                                      Container(
                                        width: 131,
                                        height: 20,
                                        color: const Color(0xffFBFBFC).withAlpha(128),
                                      ),
                                      const SizedBox(height: 20.0,),
                                      Container(
                                        width: 50,
                                        height: 9,
                                        color: const Color(0xffFBFBFC).withAlpha(128),
                                      ),
                                      const SizedBox(height: 3.0,),
                                      Container(
                                        width: 38,
                                        height: 9,
                                        color: const Color(0xffFBFBFC).withAlpha(128),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'No master card added',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: ColorManager.labelColor),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0),
                              child: Text(
                                'You can add a mastercard and save it for later',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: ColorManager
                                            .restaurantCategoriesColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AddNewCardButton(totalPrice: totalPrice),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: BottomNavBar(totalPrice: totalPrice),
    );
  }
}







