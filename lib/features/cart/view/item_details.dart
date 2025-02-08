import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/features/cart/view/drop_down_list.dart';
import 'package:food_app/features/cart/view/filter_dialog.dart';
import 'package:food_app/features/cart/view/popular_items.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const ArrowBackButton(),
                      const SizedBox(width: 20.0,),
                      const DropDownList(),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 23,
                        backgroundColor: ColorManager.restaurantTitleColor,
                        child: ImageIcon(AssetImage(AssetsManager.search),color: ColorManager.white,),
                      ),
                      const SizedBox(width: 10.0,),
                      GestureDetector(
                        onTap: (){
                          showFilterDialog(context);
                        },
                          child: Image.asset(AssetsManager.filter)),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                const PopularItems()



              ],
            ),
          ),
        ),
      ),
    );
  }
}





