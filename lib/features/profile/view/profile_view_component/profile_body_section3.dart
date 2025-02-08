import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/models/profile_model.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class ProfileBodySection3 extends StatelessWidget {
  ProfileBodySection3({super.key});

  final List<ProfileModel> itemModel = [
    ProfileModel(
        icon: FontAwesomeIcons.circleQuestion,
        title: 'FAQs',
        color: ColorManager.lightOrange4),
    ProfileModel(
        imageIcon: AssetsManager.userReviews,
        title: 'User Reviews',
        color: const Color(0xff2AE1E1)),
    ProfileModel(
        icon: FontAwesomeIcons.gear,
        title: 'Setting',
        color: ColorManager.blue),
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
        children: itemModel.asMap().entries.map((entry){
          int index = entry.key;
          var item = entry.value;
          return ListTile(
            leading: CircleAvatar(
              radius: 22,
              backgroundColor: ColorManager.white,
              child: index==1?
              SvgPicture.asset(item.imageIcon!,width: 14,height: 14,)
                  :Icon(item.icon,color: item.color,size: 14,),

            ),
            title: Text(item.title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorManager.labelColor
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xff747783),size: 14,),

          );
        }).toList(),
      ),
    );
  }
}