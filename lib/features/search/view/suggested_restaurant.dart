import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/max_grey_container.dart';
import 'package:food_app/features/search/view_model/search_cubit.dart';
import 'package:food_app/features/search/view_model/search_states.dart';

class SuggestedRestaurant extends StatelessWidget {
  const SuggestedRestaurant({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchStates>(
        builder: (context,state){
          SearchCubit cubit = SearchCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Suggested Restaurants',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.labelColor,
                    fontSize: 20
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                    itemCount: cubit.searchResult.isNotEmpty?
                    cubit.searchResult.length:cubit.suggestedRestaurant.length,
                    itemBuilder: (context,index){
                      var item = cubit.searchResult.isNotEmpty?  cubit.searchResult: cubit.suggestedRestaurant;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xffEBEBEB),
                                ),
                              )
                          ),
                          child: Row(
                            children: [
                              const MaxGreyContainer(
                                height: 57,
                                width: 61,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item[index].restaurantName,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ColorManager.labelColor,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_border,
                                        size: 18,
                                        color: ColorManager.primaryColor,
                                      ),
                                      const SizedBox(width: 10.0,),
                                      Text(
                                          item[index].rate,
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: ColorManager.restaurantTitleColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );

                    }),
              ),

            ],
          );
        });
  }
}
