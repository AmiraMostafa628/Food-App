import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        Text("See All",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const Icon(Icons.arrow_forward_ios,
          size: 14,
          color: ColorManager.iconColor,)
      ],
    );
  }
}