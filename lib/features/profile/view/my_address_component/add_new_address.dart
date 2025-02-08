import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/features/profile/view/my_address_component/new_address_view_body.dart';


class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.trackOrderBackGround,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            spacing: 70,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ArrowBackButton(buttonColor:Color(0xff212029),iconColor: ColorManager.white,),
              Column(
                spacing: 20,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: ColorManager.labelColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:  Text('Move to edit location',
                            style:Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontWeight: FontWeight.normal,
                              color: ColorManager.white,
                            )
                        ),
                      ),
                      const Positioned(
                        bottom: -23,
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 40,
                          color: ColorManager.labelColor,),
                      ),
                    ],
                  ),
                  const Center(
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Color(0xffF6916D),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: ColorManager.orange,
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),

      bottomNavigationBar: const NewAddressViewBody(),

    );
  }
}
