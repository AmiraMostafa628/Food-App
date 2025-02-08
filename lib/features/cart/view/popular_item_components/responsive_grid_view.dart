import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/max_grey_container.dart';
import 'package:food_app/core/utils/shared_widgets/responsive_value.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';
import 'package:go_router/go_router.dart';

class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartStates>(
        builder: (BuildContext context,state){
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: getHorizontalPadding(context),vertical: 10.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 6.0,
              height: getScaleFactor(context),
            ),
            itemCount: CartCubit.get(context).popularItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  CartCubit.get(context).resetAmount();
                  CartCubit.get(context).setInitialPrice(CartCubit.get(context).popularItems[index].price);

                  GoRouter.of(context).push(AppRouter.kPopularItemDetails,
                      extra: CartCubit.get(context).popularItems[index]);
                },
                child: Card(
                  color: ColorManager.white,
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: MaxGreyContainer(
                            height: 84,
                            width: 122,
                          ),
                        ),
                        const SizedBox(height: 12.0,),
                        Text(CartCubit.get(context).popularItems[index].restaurantName,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.labelColor

                          ),
                        ),
                        const SizedBox(height: 5.0,),
                        Text(CartCubit.get(context).popularItems[index].restaurantCategories,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 13

                          ),
                        ),
                        const SizedBox(height: 8.0,),
                        Row(
                          children: [
                            Text('\$${CartCubit.get(context).popularItems[index].price}',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            const Spacer(),
                            const CircleAvatar(
                              radius: 16,
                              backgroundColor: ColorManager.primaryColor,
                              child: Icon(Icons.add,color: Colors.white,),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}

class SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight extends SliverGridDelegate {

  final int crossAxisCount;

  final double mainAxisSpacing;

  final double crossAxisSpacing;

  final double height;

  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight({
    required this.crossAxisCount,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.height = 56.0,
  })  : assert(crossAxisCount > 0),
        assert(mainAxisSpacing >= 0),
        assert(crossAxisSpacing >= 0),
        assert(height > 0);



  bool _debugAssertIsValid() {
    assert(crossAxisCount > 0);
    assert(mainAxisSpacing >= 0.0);
    assert(crossAxisSpacing >= 0.0);
    assert(height > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid());
    final double usableCrossAxisExtent =
        constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1);
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final double childMainAxisExtent = height;
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight oldDelegate) {
    return oldDelegate.crossAxisCount != crossAxisCount ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.height != height;
  }
}




