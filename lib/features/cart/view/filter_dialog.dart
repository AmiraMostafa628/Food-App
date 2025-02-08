import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/features/cart/view/filter_dialog_components/deliver_time_section.dart';
import 'package:food_app/features/cart/view/filter_dialog_components/offer_section.dart';
import 'package:food_app/features/cart/view/filter_dialog_components/pricing_section.dart';
import 'package:food_app/features/cart/view/filter_dialog_components/rating_section.dart';

void showFilterDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierColor: Colors.grey.withAlpha(128),
      builder: (
        context,
      ) {
        return Dialog(
          backgroundColor: ColorManager.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 20,vertical: MediaQuery.of(context).size.height *.05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter your search',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ColorManager.restaurantTitleColor),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: ColorManager.lightGrey,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.clear,
                            size: 20,
                          ),
                          color: ColorManager.textColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const OfferSection(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const DeliverTimeSection(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const PricingSection(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const RatingSection(),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const CustomButton(text: 'Filter'),
                ],
              ),
            ),
          ),
        );
      });
}








