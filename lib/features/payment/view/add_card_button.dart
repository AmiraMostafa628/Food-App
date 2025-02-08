import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:go_router/go_router.dart';

class AddNewCardButton extends StatelessWidget {
  const AddNewCardButton({
    super.key,
    required this.totalPrice,
  });

  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            side: const BorderSide(
                color: ColorManager.fillTextFieldColor, width: 1),
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kAddCardView,extra: totalPrice);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:20.0),
            child: Text(
              '+ Add New',
              style:
              Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorManager.primaryColor,
              ),
            ),
          )),
    );
  }
}