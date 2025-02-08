import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_text_form_field.dart';

class PasswordViewBody extends StatelessWidget {
  PasswordViewBody({super.key});

  final emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email'.toUpperCase(),
            style: Theme
                .of(context)
                .textTheme
                .labelSmall!
                .copyWith(
                color: ColorManager.labelColor,
                fontWeight: FontWeight.normal

            ),
          ),
          const SizedBox(height: 10.0,),
          CustomTextFormField(
            text: 'example@gmail.com',
            textEditingController: emailController,
            color: ColorManager.fillTextFieldColor,
            type: TextInputType.emailAddress,
            validate: ( value) {
              if (value!.isEmpty) {
                return 'Email Can\'t be Empty';}
              return null;
            },

          ),
          const SizedBox(height: 30.0,),
          const CustomButton(text: 'send code'),

        ],
      ),
    );
  }
}