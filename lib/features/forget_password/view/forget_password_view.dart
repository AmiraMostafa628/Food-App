import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_background_container.dart';
import 'package:food_app/core/utils/shared_widgets/custom_container.dart';
import 'package:food_app/features/forget_password/view/password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Padding(
             padding: EdgeInsets.only(top: 20.0,left: 20.0),
             child: ArrowBackButton(buttonColor: ColorManager.white,),
           ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Forget Password',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 10,),
            Center(
              child: Text('Please sign in to your existing account',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 50,),
            CustomContainer(child: PasswordViewBody()),

          ],
        ));
  }
}


