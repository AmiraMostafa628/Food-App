import 'package:flutter/material.dart';
import 'package:food_app/core/utils/models/message_model.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class ReceiverMessage extends StatelessWidget {
  const ReceiverMessage({super.key, required this.model});

  final MessageModel model;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: IntrinsicWidth(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Text(model.messageTime!,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: const Color(0xffABABAB),
                    ),
                  ),
                ),
              ),
              if(model.text!='')
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundColor: ColorManager.restaurantCategoriesColor,
                    ),
                    const SizedBox(width: 10.0,),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                          color: ColorManager.fillTextFieldColor,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(10.0),
                            topEnd: Radius.circular(10.0),
                            bottomEnd: Radius.circular(10.0),

                          )
                      ),
                      child: Text(model.text!,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: ColorManager.labelColor,
                            fontSize: 14
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
