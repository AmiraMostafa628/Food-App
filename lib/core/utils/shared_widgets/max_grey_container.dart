import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class MaxGreyContainer extends StatelessWidget {
  const MaxGreyContainer(
      {super.key,
      this.height = 150,
      this.borderRadius = 15,
      this.width = double.infinity,
        this.backgroundColor = ColorManager.grey,
      });

  final double height;
  final double borderRadius;
  final double width;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
