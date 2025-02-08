import 'package:flutter/material.dart';
import 'package:food_app/core/utils/models/other_login_model.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class OrLoginWidget extends StatelessWidget {
  OrLoginWidget({super.key});

  final List<OtherLoginModel> items = [
    OtherLoginModel(
        circleColor: ColorManager.facebookCirCleColor,
        image: AssetsManager.facebookLogo),
    OtherLoginModel(
        circleColor: ColorManager.twitterCirCleColor,
        image: AssetsManager.twitterLogo),
    OtherLoginModel(
        circleColor: ColorManager.iosCirCleColor,
        image: AssetsManager.iosLogo),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Or',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item){
            return CircleAvatar(
              radius: 38,
              backgroundColor: item.circleColor,
              child: Image.asset(item.image),
            );
          }).toList(),
        ),
      ],
    );
  }
}