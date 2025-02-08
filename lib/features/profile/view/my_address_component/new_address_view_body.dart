import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_text_form_field.dart';
import 'package:food_app/features/profile/view/my_address_component/address_type_section.dart';

class NewAddressViewBody extends StatelessWidget {
  const NewAddressViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address'.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: ColorManager.labelColor,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom: 20),
                child: CustomTextFormField(
                  text: '3235 Royal Ln. mesa, new jersy 34567',
                  prefixIcon: Icons.location_on,
                  textEditingController: TextEditingController(),
                  color: ColorManager.fillTextFieldColor,
                  type: TextInputType.text,
                ),
              ),
              Row(
                spacing: 15.0,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5.0,
                      children: [
                        Text(
                          'street'.toUpperCase(),
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: ColorManager.labelColor,
                              fontWeight: FontWeight.normal),
                        ),
                        CustomTextFormField(
                          text: 'hason nagar',
                          textEditingController: TextEditingController(),
                          color: ColorManager.fillTextFieldColor,
                          type: TextInputType.text,
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5.0,
                      children: [
                        Text(
                          'Post code'.toUpperCase(),
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: ColorManager.labelColor,
                              fontWeight: FontWeight.normal),
                        ),
                        CustomTextFormField(
                          text: '34567',
                          textEditingController: TextEditingController(),
                          color: ColorManager.fillTextFieldColor,
                          type: TextInputType.text,
                        ),
                      ],
                    ),
                  )

                ],
              ),
              const SizedBox(height: 20.0,),
              Text(
                'Appartment'.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: ColorManager.labelColor,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom: 20),
                child: CustomTextFormField(
                  text: '345',
                  prefixIcon: Icons.location_on,
                  textEditingController: TextEditingController(),
                  color: ColorManager.fillTextFieldColor,
                  type: TextInputType.text,
                ),
              ),
              AddressTypeSection(),
              const SizedBox(height: 40.0,),
              const CustomButton(text: 'Save location'),


            ],
          ),
        ),
      ),
    );
  }
}