import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';

class DeliverTimeSection extends StatelessWidget {
  const DeliverTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deliver Time'.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: ColorManager.labelColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: CartCubit.get(context).time.map((item) {
                  final int index = CartCubit.get(context).time.indexOf(item);
                  final bool isSelected =
                      CartCubit.get(context).deliverTimeIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        CartCubit.get(context).selectDeliverTime(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isSelected
                                ? ColorManager.primaryColor
                                : ColorManager.fillTextFieldColor,
                            border: Border.all(
                                color: const Color(0xffEBEBEB), width: 1)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15),
                            child: Text(
                              item,
                              style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: isSelected
                                    ? ColorManager.white
                                    : ColorManager.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}