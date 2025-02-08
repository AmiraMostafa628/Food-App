import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_background_container.dart';
import 'package:food_app/core/utils/shared_widgets/custom_container.dart';
import 'package:food_app/features/sign_up/view/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, required this.email,});

  final String email;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15.0,left: 15.0),
              child: ArrowBackButton(buttonColor: ColorManager.white,),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Verification',
                style: Theme.of(context).textTheme.bodyLarge, ),
            ),
            const SizedBox(
              height: 30,
            ),

            CustomContainer(child: VerificationViewBody(
              emailAddress: email,
             )),


          ],
        ));
  }
}

