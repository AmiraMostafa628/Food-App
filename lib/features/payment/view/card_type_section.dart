import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/payment/view/card_type_section_components/selected_and_unselected_card.dart';
import 'package:food_app/features/payment/view_model/payment_cubit.dart';
import 'package:food_app/features/payment/view_model/payment_states.dart';


class CardTypeSection extends StatelessWidget {
  const CardTypeSection({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:BlocBuilder<PaymentCubit,PaymentStates>(
        builder: (context,state){
          return  Row(
            children:
            PaymentCubit.get(context).itemModel.map((item) {
              final int index =
              PaymentCubit.get(context).itemModel.indexOf(item);
              final bool isSelected =
                  PaymentCubit.get(context).selectedIndex == index;
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      PaymentCubit.get(context).selectCard(index);
                    },
                    child: isSelected
                        ? SelectedCard(
                        icon: PaymentCubit.get(context)
                            .itemModel[index]
                            .icon)
                        : UnSelectedCard(
                        icon: PaymentCubit.get(context)
                            .itemModel[index]
                            .icon),
                  ),
                  Text(
                    PaymentCubit.get(context)
                        .itemModel[index]
                        .title,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                      color: const Color(0xff464E57),
                    ),
                  )
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}