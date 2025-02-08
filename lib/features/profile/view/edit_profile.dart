import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/features/profile/view/edit_profile_component/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    spacing: 20,
                    children: [
                      const ArrowBackButton(),
                      Text('Personal Info',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.restaurantTitleColor,
                          fontSize: 17,
                        ),
                      ),
            
                    ],
                  ),
                  const Center(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 65,
                          backgroundColor: ColorManager.pink,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: ColorManager.primaryColor,
                          child: Icon(Icons.edit,
                            size: 18,
                            color: ColorManager.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const EditProfileViewBody(),
                  const CustomButton(text: 'Save')
                ],
              ),
            ),
          )),
    );
  }
}



