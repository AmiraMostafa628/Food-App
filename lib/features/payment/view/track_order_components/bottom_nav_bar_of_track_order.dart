import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/max_grey_container.dart';

class BottomNavBarOfTrackOrder extends StatelessWidget {
  const BottomNavBarOfTrackOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 7.0,
                width: 70.0,
                decoration: BoxDecoration(
                  color: const Color(0xffD8E3ED),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MaxGreyContainer(
                    width: 63,
                    height: 63,
                  ),
                  const SizedBox(width: 10.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Uttora Coffee House',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: ColorManager.restaurantTitleColor,
                        ),
                      ),
                      const SizedBox(height: 4.0,),
                      Text('Orderd at 06 Sept, 10:00pm',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: ColorManager.restaurantCategoriesColor,
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Text('2x Burger',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 13
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Text('4x Sandwich',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 13
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}