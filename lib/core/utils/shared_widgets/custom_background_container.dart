import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class CustomBackgroundContainer extends StatelessWidget {
  const CustomBackgroundContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Container(
              decoration: const BoxDecoration(
                color: ColorManager.restaurantTitleColor,
                image: DecorationImage(
                    image: AssetImage(AssetsManager.containerBackground,),
                    fit: BoxFit.fill
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}


