import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_text_form_field.dart';
import 'package:food_app/features/cart/view_model/cart_cubit.dart';
import 'package:food_app/features/cart/view_model/cart_states.dart';
import 'package:food_app/features/search/view/popular_fast_food.dart';
import 'package:food_app/features/search/view/suggested_restaurant.dart';
import 'package:food_app/features/search/view_model/search_cubit.dart';
import 'package:food_app/features/search/view_model/search_states.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const ArrowBackButton(),
                        const SizedBox(
                          width: 30.0,
                        ),
                        Text(
                          'Search',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorManager.restaurantTitleColor,
                                    fontSize: 17,
                                  ),
                        ),
                        const Spacer(),
                        Image.asset(AssetsManager.cart),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: CustomTextFormField(
                        text: 'Search dishes, restaurants',
                        color: ColorManager.textFormFieldColor,
                        prefixIcon: Icons.search_rounded,
                        textEditingController: searchController,
                        suffixIcon: Icons.clear,
                        onChange: (value) {
                          SearchCubit.get(context)
                              .updateSearchResult(value.toLowerCase());
                        },
                        suffixPressed: () {
                          searchController.clear();
                        },
                      ),
                    ),
                    Text(
                      'Recent Keywords',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.labelColor, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<CartCubit, CartStates>(
                        builder: (context, state) {
                      return SizedBox(
                        height: 55,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: SearchCubit.get(context).items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    CartCubit.get(context).changeDropDownItem(
                                        SearchCubit.get(context).items[index]);
                                    GoRouter.of(context).push(
                                      AppRouter.kItemDetails,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: const Color(0xffEBEBEB),
                                            width: 1)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 15),
                                        child: Text(
                                          SearchCubit.get(context).items[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: ColorManager
                                                      .restaurantTitleColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    const SuggestedRestaurant(),
                    const SizedBox(
                      height: 20,
                    ),
                    const PopularFastFood(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
