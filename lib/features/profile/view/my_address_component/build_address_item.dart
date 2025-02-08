import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/models/personal_info_model.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class BuildAddressItem extends StatelessWidget {
  const BuildAddressItem({super.key, required this.personalInfoModel,});

  final PersonalInfoModel personalInfoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          color: ColorManager.fillTextFieldColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        spacing: 20.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: ColorManager.white,
            child: Icon(personalInfoModel.icon,color: personalInfoModel.iconColor,size: 14,),

          ),
          Flexible(
            child: Column(
              spacing: 5.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(personalInfoModel.title.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: ColorManager.labelColor,)
                ),
                Text( personalInfoModel.subTitle,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: ColorManager.restaurantCategoriesColor
                    )
                )

              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Row(
              spacing: 15,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(FontAwesomeIcons.penToSquare,color: ColorManager.orange,size: 16,),
                Icon(FontAwesomeIcons.trashCan,color: ColorManager.orange,size: 16,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}