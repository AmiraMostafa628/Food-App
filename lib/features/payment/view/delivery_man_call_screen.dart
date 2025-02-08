import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class DeliveryManCallScreen extends StatelessWidget {
  const DeliveryManCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff273F55),
     bottomNavigationBar: Material(
       color: ColorManager.white,
       borderRadius: const BorderRadius.only(
         topRight: Radius.circular(30),
         topLeft: Radius.circular(30),

       ),
       child: IntrinsicHeight(
         child: Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               const CircleAvatar(
                 radius: 35,
                 backgroundColor: ColorManager.trackOrderBackGround,
                 child: Icon(Icons.person,color: ColorManager.arrowColor,size: 38,),
               ),
               const SizedBox(height: 15.0,),
               Text('Robert F.',
                 style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               const SizedBox(height: 5.0,),
               Text('Connecting.......',
                 style: Theme.of(context).textTheme.displayMedium!.copyWith(
                   fontSize: 14,
                   color: ColorManager.restaurantCategoriesColor,
                 ),
               ),
               const SizedBox(height: 30,),
               const Row(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   CircleAvatar(
                     radius: 18,
                     backgroundColor: ColorManager.lightGrey,
                     child: Icon(Icons.mic_off,color: ColorManager.restaurantTitleColor,),
                   ),
                   CircleAvatar(
                     radius:45,
                     backgroundColor: Color(0xffFFF8F4),
                     child: CircleAvatar(
                       radius: 35,
                       backgroundColor: Color(0xffFFEBDF),
                       child: CircleAvatar(
                         radius: 28,
                         backgroundColor: ColorManager.red,
                         child: Icon(Icons.call,color: ColorManager.white,),
                       ),
                     ),
                   ),
                   CircleAvatar(
                     radius: 18,
                     backgroundColor: ColorManager.lightGrey,
                     child: Icon(Icons.volume_up_outlined,color: ColorManager.restaurantTitleColor,),
                   ),
                 ],
               ),
               const SizedBox(height: 30,),
         
             ],
           ),
         ),
       ),
     ),
    );
  }
}
