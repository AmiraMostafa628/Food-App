import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';



class PersonalData extends StatelessWidget {
  const PersonalData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30.0,
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundColor: ColorManager.pink,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5.0,
          children: [
            Text('Vishal Khadok',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 20,
                color: ColorManager.restaurantTitleColor,
              ),
            ),
            Text('I love fast food',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.normal,
                color: ColorManager.restaurantCategoriesColor,
              ),
            )
          ],
        )
      ],
    );
  }
}