import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/features/my_orders/view/tab_section.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20.0,
          children: [
            Row(
              children: [
                const ArrowBackButton(),
                const SizedBox(width: 20.0,),
                Text('My Orders',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.restaurantTitleColor,
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                const ArrowBackButton(icon:FontAwesomeIcons.ellipsis)
      
              ],
            ),
            const Expanded(child: TabBarSection())
      
          ],
        ),
      ),
    );
  }
}







