import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/max_grey_container.dart';
import 'package:food_app/features/search/view_model/search_cubit.dart';
import 'package:food_app/features/search/view_model/search_states.dart';
class PopularFastFood extends StatelessWidget {
  const PopularFastFood({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchStates>
      (builder: (context,state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Popular Fast Food',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorManager.labelColor,
                  fontSize: 20
              ),
            ),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:SearchCubit.get(context).popularFastFood.map((item){
                return  Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Card(
                      color: ColorManager.white,
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: MaxGreyContainer(
                                height: 85,
                                width: 125,
                              ),
                            ),
                            const SizedBox(height: 5.0,),
                            Text(item.restaurantName,
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.labelColor
                  
                              ),
                            ),
                            const SizedBox(height: 5.0,),
                            Text(item.restaurantCategories,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 13
                  
                              ),
                            ),
                  
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList()
            ),
          ],
        );
    });
  }
}
