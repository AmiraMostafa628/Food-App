import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/features/payment/view/track_order_components/bottom_nav_bar_of_track_order.dart';
import 'package:food_app/features/payment/view/track_order_components/bottom_sheet_of_track_order.dart';
import 'package:food_app/features/payment/view_model/payment_cubit.dart';
import 'package:food_app/features/payment/view_model/payment_states.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.trackOrderBackGround,
      body: SafeArea(
        child: BlocBuilder<PaymentCubit,PaymentStates>(
            builder: (context,state){
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const ArrowBackButton(buttonColor:Color(0xff212029),iconColor: ColorManager.white,),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Track Order',
                          style:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorManager.restaurantTitleColor,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35.0,),
                    PaymentCubit.get(context).isShown?
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Image.asset(AssetsManager.trackOrder2),
                    ):
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Image.asset(AssetsManager.trackOrder),
                    )

                  ],
                ),
              );
            }),
      ),

      bottomNavigationBar: GestureDetector(
          onVerticalDragEnd:(details) {
            if (details.primaryVelocity! < 0) {
              showBottomSheetFunction(context);
            }
          },
          child: const BottomNavBarOfTrackOrder()),

    );

  }
}

