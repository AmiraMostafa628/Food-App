import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class OfferSection extends StatelessWidget {
  const OfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'offers'.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: ColorManager.labelColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xffEBEBEB), width: 1)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  child: Text(
                    'Delivery',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorManager.restaurantTitleColor),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xffEBEBEB), width: 1)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  child: Text(
                    'Pick Up',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorManager.restaurantTitleColor),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xffEBEBEB), width: 1)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  child: Text(
                    'Offer',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorManager.restaurantTitleColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        IntrinsicWidth(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xffEBEBEB), width: 1)),
            child: Center(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                child: Text(
                  'Online payment available',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ColorManager.restaurantTitleColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}