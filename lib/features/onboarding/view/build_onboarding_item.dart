import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/cache_helper.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/models/onboarding_model.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({super.key, required this.model, required this.boardController, required this.modelLength, required this.isLast});

  final OnBoardingModel model;
  final int modelLength;
  final PageController boardController;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          Container(
            height: 270,
            width: 200,
            decoration: BoxDecoration(
              color: ColorManager.grey,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            model.title,
            style: Theme.of(context).textTheme.bodyMedium,

          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            model.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,

          ),
          const SizedBox(
            height: 50,
          ),
          SmoothPageIndicator(
              controller: boardController,
              effect: const SlideEffect(
                dotColor: ColorManager.lightOrange,
                activeDotColor:ColorManager.primaryColor,
                dotHeight: 13,
                dotWidth: 13,
                spacing: 10.0,
              ),
              count: modelLength),
          const SizedBox(
            height: 60,
          ),
          CustomButton(
            text: 'Next',
            onPressed: (){
              if(isLast == false){
                boardController.nextPage(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.fastLinearToSlowEaseIn);
              }
              else{
                CacheHelper.saveData(key: 'seenOnboarding', value: true);
                GoRouter.of(context).push(AppRouter.kLoginView);
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              CacheHelper.saveData(key: 'seenOnboarding', value: true);
              GoRouter.of(context).push(AppRouter.kLoginView,);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Skip',
                style: Theme.of(context).textTheme.bodySmall,

              ),
            ),
          ),

        ],
      ),
    );
  }
}