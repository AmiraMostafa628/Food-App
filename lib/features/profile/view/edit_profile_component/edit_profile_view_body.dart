import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/custom_text_form_field.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'username'.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorManager.labelColor,
              fontWeight: FontWeight.normal),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 20),
          child: CustomTextFormField(
            text: 'Vishal Khadok',
            textEditingController: TextEditingController(),
            color: ColorManager.fillTextFieldColor,
            type: TextInputType.text,
          ),
        ),
        Text(
          'Email'.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorManager.labelColor,
              fontWeight: FontWeight.normal),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 20),
          child: CustomTextFormField(
            text: 'hello@halallab.co',
            textEditingController: TextEditingController(),
            color: ColorManager.fillTextFieldColor,
            type: TextInputType.emailAddress,
          ),
        ),
        Text(
          'Phone Number'.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorManager.labelColor,
              fontWeight: FontWeight.normal),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 20),
          child: CustomTextFormField(
            text: '408-841-0926',
            textEditingController: TextEditingController(),
            color: ColorManager.fillTextFieldColor,
            type: TextInputType.text,
          ),
        ),
        Text(
          'Bio'.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorManager.labelColor,
              fontWeight: FontWeight.normal),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 20),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: ColorManager.fillTextFieldColor,
              borderRadius: BorderRadius.circular(12),),
            child: CustomTextFormField(
              text: 'I love fast food',
              textEditingController: TextEditingController(),
              color: ColorManager.fillTextFieldColor,
              type: TextInputType.text,
            ),
          ),
        ),
      ],
    );
  }
}