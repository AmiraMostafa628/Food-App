import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/max_grey_container.dart';
import 'package:food_app/core/utils/shared_widgets/text_header.dart';
import 'package:food_app/features/home/view_model/home_cubit/home_cubit.dart';
import 'package:food_app/features/home/view_model/home_cubit/home_states.dart';

class OpenRestaurantsWidget extends StatelessWidget {
  const OpenRestaurantsWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
        builder: (context,state){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextHeader(text: 'Open Restaurants'),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: HomeCubit.get(context).restaurantModel.map((item) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MaxGreyContainer(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        item.restaurantName,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 20,
                          color: ColorManager.restaurantTitleColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        item.restaurantCategories,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: ColorManager.restaurantCategoriesColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const CustomRestaurantInfo(),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  );
                }).toList(),
              )
            ],
          );
        });
  }
}

class CustomRestaurantInfo extends StatelessWidget {
  const CustomRestaurantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(
          Icons.star_border,
          size: 28,
          color: ColorManager.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            '4.7',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(
                color: ColorManager.restaurantTitleColor,
                fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 35,
        ),
        const ImageIcon(
          color: ColorManager.primaryColor,
          AssetImage(
            AssetsManager.delivery,
          ),
          size: 28,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Free',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: ColorManager.restaurantTitleColor,),
          ),
        ),
        const SizedBox(
          width: 35,
        ),
        const Icon(
          Icons.watch_later_outlined,
          size: 28,
          color: ColorManager.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            '20 min',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: ColorManager.restaurantTitleColor),
          ),
        ),
      ],
    );
  }
}

