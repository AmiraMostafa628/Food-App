import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/models/profile_model.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:go_router/go_router.dart';

class ProfileBodySection1 extends StatelessWidget {
  ProfileBodySection1({super.key});

  final List<ProfileModel> itemModel = [
    ProfileModel(
        icon: FontAwesomeIcons.user,
        title: 'Personal Info',
        color: ColorManager.primaryColor),
    ProfileModel(
        icon: FontAwesomeIcons.map,
        title: 'Addresses',
        color: ColorManager.blue)
  ];

  final List<String> screens = [AppRouter.kPersonalInfoView,AppRouter.kMyAddressView,];

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
        children: itemModel.asMap().entries.map((entry){
          int index = entry.key;
          var item = entry.value;
          return GestureDetector(
            onTap: (){
              GoRouter.of(context).push(screens[index]);
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: ColorManager.white,
                child: Icon(item.icon,color: item.color,size: 14,),

              ),
              title: Text(item.title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.labelColor
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xff747783),size: 14,),

            ),
          );
        }).toList(),
      ),
    );
  }
}