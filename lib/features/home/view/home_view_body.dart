import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/custom_text_form_field.dart';
import 'package:food_app/core/utils/shared_widgets/open_restaurant_widget.dart';
import 'package:food_app/features/home/view/categories_widget.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
   HomeViewBody({super.key});

  final TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25.0,),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color:ColorManager.lightGrey,
                          shape: BoxShape.circle
                        ),

                        child: IconButton(
                            onPressed: () {
                            },
                            color: ColorManager.lightGrey,
                            icon: const ImageIcon(
                              AssetImage(AssetsManager.menu),
                              color: ColorManager.restaurantTitleColor,
                            )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deliver to'..toUpperCase(),
                            style:
                            Theme.of(context).textTheme.displaySmall,
                          ),
                          Row(
                            children: [
                              Text(
                                'Halal Lab office',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: ColorManager.greyTextColor,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                size: 16,
                                color: Color(0xff181C2E),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'Hey Halal, ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                          color: const Color(0xff1E1D1D),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Good Afternoon!',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: const Color(0xff1E1D1D),
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextFormField(
                      text: 'Search dishes, restaurants',
                      color: ColorManager.textFormFieldColor,
                      readOnly: true,
                      onTap: (){
                        GoRouter.of(context).push(AppRouter.kSearchView,);
                      },
                      prefixIcon: FontAwesomeIcons.magnifyingGlass,
                      textEditingController: searchController),
                  const SizedBox(height: 15.0,),
                ],
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: CategoriesWidget(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 30.0),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: OpenRestaurantsWidget(),
          ),
        ),
      ],
    );
  }
}
