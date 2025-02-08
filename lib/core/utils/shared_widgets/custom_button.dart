import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    this.borderRadius,
    required this.text,
    this.fontSize = 14.0,
    this.onPressed, this.height,
    this.upperCase=true,
    this.fontWeight = FontWeight.w700,
    this.backGroundColor = ColorManager.primaryColor, this.fontColor=ColorManager.white});

  final BorderRadius? borderRadius;
  final String text;
  final double fontSize;
  final Color fontColor;
  final double? height;
  final void Function()? onPressed;
  final bool upperCase;
  final FontWeight fontWeight;
  final Color backGroundColor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??60,
      width: double.infinity,
      child: TextButton(
          onPressed:onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                    color: ColorManager.primaryColor
                )
            )
          ),
          child: Text(
            upperCase?text.toUpperCase():text,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fontColor,
          ),)),
    );
  }
}

/*class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key,
    this.borderRadius,
    required this.text,
    this.fontSize, this.onPressed, this.height});

  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;
  final double? height;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??60,
      width: double.infinity,
      child: TextButton(
          onPressed:onPressed,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: ColorManager.primaryColor
                )
              )
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.displaySmall,)),
    );
  }
}*/


