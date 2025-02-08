import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/features/profile/view/personl_info_component/personal_data.dart';
import 'package:food_app/features/profile/view/profile_view_component/profile_body_section1.dart';
import 'package:food_app/features/profile/view/profile_view_component/profile_body_section2.dart';
import 'package:food_app/features/profile/view/profile_view_component/profile_body_section3.dart';
import 'package:food_app/features/profile/view/profile_view_component/profile_body_section4.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              children: [
                Row(
                  children: [
                    const ArrowBackButton(),
                    const SizedBox(width: 20.0,),
                    Text('Profile',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.restaurantTitleColor,
                        fontSize: 17,
                      ),
                    ),
                    const Spacer(),
                    const ArrowBackButton(icon:FontAwesomeIcons.ellipsis)
          
                  ],
                ),
                const PersonalData(),
                ProfileBodySection1(),
                ProfileBodySection2(),
                ProfileBodySection3(),
                ProfileBodySection4()
          
          
              ],
            ),
          ),
        ),
      ),
    );

  }
}







