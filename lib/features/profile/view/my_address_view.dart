import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/models/personal_info_model.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/features/profile/view/my_address_component/build_address_item.dart';
import 'package:go_router/go_router.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 30.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 20,
                children: [
                  const ArrowBackButton(),
                  Text('My Address',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorManager.restaurantTitleColor,
                      fontSize: 17,
                    ),
                  ),

        
                ],
              ),
              BuildAddressItem(
                personalInfoModel: PersonalInfoModel
                  (iconColor: ColorManager.lightBlue,
                    icon: FontAwesomeIcons.house,
                    title: 'home',
                    subTitle: '2464 Royal Ln. Mesa, New Jersey 45463'),
              ),
              BuildAddressItem(
                personalInfoModel: PersonalInfoModel
                  (iconColor: ColorManager.purple,
                    icon: FontAwesomeIcons.suitcase,
                    title: 'Work',
                    subTitle: '3891 Ranchview Dr. Richardson, California 62639'),
              ),
              const Spacer(),
              CustomButton(
                onPressed: (){
                  GoRouter.of(context).push(AppRouter.kAddNewAddressView);
                },
                  text: 'Add new address'),
        
            ],
          ),
        ),
      ),

    );
  }
}




