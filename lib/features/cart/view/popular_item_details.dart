import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/models/restaurant_model.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/core/utils/shared_widgets/max_grey_container.dart';
import 'package:food_app/core/utils/shared_widgets/open_restaurant_widget.dart';
import 'package:food_app/features/cart/view/popular_item_details_components/food_size.dart';
import 'package:food_app/features/cart/view/popular_item_details_components/ingredient_info.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';
import 'package:go_router/go_router.dart';

class PopularItemDetails extends StatelessWidget {
  const PopularItemDetails({super.key, required this.restaurantModel});

  final RestaurantModel restaurantModel;


  @override
  Widget build(BuildContext context) {
    String selectedSize = '14”';

    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ArrowBackButton(),
                    const SizedBox(width: 20.0,),
                    Text('Details',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.restaurantTitleColor,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    const MaxGreyContainer(height: 200,borderRadius: 30,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0,right: 15.0),
                      child: CircleAvatar(
                        backgroundColor: ColorManager.iconColor.withAlpha(128),
                        radius: 20,
                        child: const Icon(FontAwesomeIcons.heart,color: ColorManager.white,size: 20,),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: const Color(0xffEBEBEB),
                            width: 1
                        )
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(AssetsManager.restaurantIcon),
                          const SizedBox(width: 10.0,),
                          Text(restaurantModel.restaurantCategories,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: ColorManager.restaurantTitleColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Text(restaurantModel.restaurantName,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorManager.restaurantTitleColor,
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 10,),
                Text('Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: ColorManager.restaurantCategoriesColor,
                    fontWeight: FontWeight.w400,
                    height: 2
                  ),
                ),
                const SizedBox(height: 35.0,),
                const CustomRestaurantInfo(),
                const SizedBox(height: 35.0,),
                FoodSize(
                  selectedSize: (size){
                    selectedSize = size??'14”';
                  },
                ),
                const SizedBox(height: 35.0,),
                const IngredientInfo(),
                const SizedBox(height: 10.0,),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  Material(
        color: ColorManager.fillTextFieldColor,
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.only(
             topLeft: Radius.circular(30),
             topRight: Radius.circular(30)
         ),
       ),
        child: BlocBuilder<CartCubit,CartStates>(
          builder: (context,state){
            return IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$${CartCubit.get(context).price}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Container(
                            decoration:  BoxDecoration(
                              color: ColorManager.textColor,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      CartCubit.get(context).decrement(restaurantModel.price);
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: ColorManager.iconColor.withAlpha(128),
                                      child: const Text('-',
                                        style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Text(CartCubit.get(context).amount.toString(),
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: ColorManager.white,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      CartCubit.get(context).increment(restaurantModel.price);
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: ColorManager.iconColor.withAlpha(128),
                                      child: const Text('+',
                                        style: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: 16
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                       CustomButton(
                        onPressed: () async{
                          await CartCubit.get(context).addCartItems(
                              restaurantModel: restaurantModel,
                              price: CartCubit.get(context).price,
                              size: selectedSize,
                              amount: CartCubit.get(context).amount.toString(),
                          ).then((value){
                               if(context.mounted){
                                 GoRouter.of(context).push(AppRouter.kCartView,);
                               }
                          });
                        },
                          text: 'Add to cart'),
                      const SizedBox(
                        height: 10.0,
                      )
                    ],
                  ),
                ));
          },
        ),
      )
    );
  }


}






