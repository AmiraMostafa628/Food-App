
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class SelectedCard extends StatelessWidget {
  const SelectedCard({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 10.0),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 90,
            width: 110,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ColorManager.primaryColor, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SvgPicture.asset(
                icon,
                width: 40,
                height: 15,
              ),
            ),
          ),
          const Positioned(
            top: -12,
            right: -12,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: ColorManager.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: ColorManager.primaryColor,
                child: Icon(
                  Icons.check,
                  size: 20,
                  color: ColorManager.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UnSelectedCard extends StatelessWidget {
  const UnSelectedCard({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 90,
        width: 110,
        decoration: BoxDecoration(
          color: ColorManager.fillTextFieldColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SvgPicture.asset(
            icon,
            width: 40,
            height: 15,
          ),
        ),
      ),
    );
  }
}