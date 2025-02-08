import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/features/profile/view/personl_info_component/personal_data.dart';
import 'package:food_app/features/profile/view/personl_info_component/personal_info_view_body.dart';
import 'package:go_router/go_router.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 20.0,
              children: [
                Row(
                  children: [
                    const ArrowBackButton(),
                    const SizedBox(width: 20.0,),
                    Text('Personal Info',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.restaurantTitleColor,
                        fontSize: 17,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push(AppRouter.kEditProfile);
                      },
                      child: Text('Edit'.toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: ColorManager.primaryColor,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorManager.primaryColor
                        ),
                      ),
                    )

                  ],
                ),
                const PersonalData(),
                PersonalInfoViewBody(),
              ],
            ),
          )),
    );
  }
}
