import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/features/payment/view/add_card_button.dart';
import 'package:food_app/features/payment/view/card_type_section.dart';
import 'package:food_app/features/payment/view/payment_view_components/bottom_nav_bar.dart';
import 'package:food_app/features/payment/view/payment_view_components/master_card.dart';
import 'package:food_app/features/payment/view/payment_view_components/visa_card.dart';
import 'package:food_app/features/payment/view_model/payment_cubit.dart';
import 'package:food_app/features/payment/view_model/payment_states.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key, required this.totalPrice});
  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:BlocBuilder<PaymentCubit,PaymentStates>(
          builder: (context,state){
            return  Padding(
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
                    height: 20.0,
                  ),
                  const CardTypeSection(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  cardType(selectedIndex: PaymentCubit.get(context).selectedIndex),
                  AddNewCardButton(totalPrice: totalPrice)

                ],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: BottomNavBar(totalPrice:totalPrice),
    );
  }
  Widget cardType({required int selectedIndex}){
    if(selectedIndex == 1)
    {
      return const Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: VisaCard(),
      );
    }
    if(selectedIndex == 2)
    {
      return const Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: MasterCard(),
      );
    }
    else{
      return Container();
    }
  }
}



