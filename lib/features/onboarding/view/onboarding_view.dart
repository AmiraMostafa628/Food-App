import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/onboarding/view/build_onboarding_item.dart';
import 'package:food_app/features/onboarding/view_model/onboarding_cubit.dart';
import 'package:food_app/features/onboarding/view_model/onboarding_state.dart';

class OnboardingView extends StatelessWidget {
   OnboardingView({super.key});
   final boardController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context)=>OnboardingCubit(),
        child: BlocBuilder<OnboardingCubit,OnboardingStates>(
          builder: (context,state){
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: PageView.builder(
                        controller: boardController,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (int index){
                          OnboardingCubit.get(context).pageViewChanged(index);
                        },
                        itemBuilder: (context,index){
                          return SingleChildScrollView(
                            child: BuildBoardingItem(
                              model: OnboardingCubit.get(context).onBoardingModel[index],
                              modelLength: OnboardingCubit.get(context).onBoardingModel.length,
                              boardController: boardController,
                              isLast: OnboardingCubit.get(context).isLast,
                            ),
                          );
                        },
                        itemCount:OnboardingCubit.get(context).onBoardingModel.length,


                      )
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}



