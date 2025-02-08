import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:go_router/go_router.dart';

class ArrowBackButton extends StatelessWidget {
   const ArrowBackButton({super.key, this.buttonColor = ColorManager.lightGrey,
     this.iconColor = ColorManager.restaurantTitleColor,
     this.icon = Icons.arrow_back_ios,
   });

  final Color buttonColor;
  final Color iconColor;
   final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
     decoration: BoxDecoration(
       color: buttonColor,
       shape: BoxShape.circle
     ),
      child: IconButton(
        onPressed: (){
          GoRouter.of(context).pop();
        },
        icon: Icon(icon,size: 17,color:iconColor,),
      ),
    );
  }
}
