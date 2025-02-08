import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/open_restaurant_widget.dart';
import 'package:food_app/features/cart/view/popular_item_components/responsive_grid_view.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartStates>(
        builder: (BuildContext context,state){
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Popular ${CartCubit.get(context).selectedValue}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorManager.labelColor,
                      fontSize: 20
                  ),
                ),
              ),
              //const GridViewWidget(),
              const ResponsiveGridView(),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: OpenRestaurantsWidget(),
              )


            ],
          );
        });

  }
}




