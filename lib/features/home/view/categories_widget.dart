import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/text_header.dart';
import 'package:food_app/features/home/view_model/home_cubit/home_cubit.dart';
import 'package:food_app/features/home/view_model/home_cubit/home_states.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
        builder: (context,state){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextHeader(
                  text: 'All Categories',
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: HomeCubit.get(context).title.map((item) {
                      final int index = HomeCubit.get(context).title.indexOf(item);
                      final bool isSelected = HomeCubit.get(context).selectedIndex == index;
                      return GestureDetector(
                        onTap: (){
                          HomeCubit.get(context).selectCategory(index);
                        },
                        child: Card(
                          elevation: 2.0,
                          color: isSelected?ColorManager.lightOrange2: ColorManager.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: ColorManager.grey,
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  item,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                      color: ColorManager.labelColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
