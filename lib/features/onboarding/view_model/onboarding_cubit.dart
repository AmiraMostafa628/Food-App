import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/models/onboarding_model.dart';
import 'package:food_app/features/onboarding/view_model/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingStates>{
  OnboardingCubit():super(OnboardingInitialStates());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  final List<OnBoardingModel> onBoardingModel = [
    OnBoardingModel(
        title: 'All your favorites',
        subTitle: 'Get all your loved foods in one once place, you just place the orer we do the rest'),
    OnBoardingModel(
        title: 'All your favorites',
        subTitle: 'Get all your loved foods in one once place, you just place the orer we do the rest'),
    OnBoardingModel(
        title: 'Order from chosen chef',
        subTitle: 'Get all your loved foods in one once place, you just place the orer we do the rest'),
    OnBoardingModel(
        title: 'Free delivery offers',
        subTitle: 'Get all your loved foods in one once place, you just place the orer we do the rest'),
  ];

   bool isLast =false;

  void pageViewChanged(int index){
    if(index==onBoardingModel.length-1)
      {
        isLast = true;
      }
    else
      {
        isLast = false;
      }
    emit(ChangePageViewStates());

  }

}