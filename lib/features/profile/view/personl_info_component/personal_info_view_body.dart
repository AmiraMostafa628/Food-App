import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/models/personal_info_model.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class PersonalInfoViewBody extends StatelessWidget {
   PersonalInfoViewBody({super.key});

  final List<PersonalInfoModel> personalModel = [
    PersonalInfoModel(
        iconColor: ColorManager.primaryColor,
        icon: FontAwesomeIcons.user,
        title: 'full name',
        subTitle: 'Vishal Khadok'),
    PersonalInfoModel(
        iconColor: ColorManager.blue,
        icon: FontAwesomeIcons.envelope,
        title: 'email',
        subTitle: 'hello@halallab.co'),
    PersonalInfoModel(
        iconColor: ColorManager.lightBlue,
        icon: FontAwesomeIcons.phone,
        title: 'phone number',
        subTitle: '408-841-0926'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: ColorManager.fillTextFieldColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        spacing: 10.0,
        children: personalModel.map((item){
          return ListTile(
            leading: CircleAvatar(
              radius: 22,
              backgroundColor: ColorManager.white,
              child:Icon(item.icon,color: item.iconColor,size: 14,)

            ),
            title: Text(item.title.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: ColorManager.labelColor,
                  fontWeight: FontWeight.normal

              ),
            ),
            subtitle: Text(item.subTitle,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: const Color(0xff6B6E82),
                  fontWeight: FontWeight.normal

              ),
            ),

          );
        }).toList(),
      ),
    );
  }
}
