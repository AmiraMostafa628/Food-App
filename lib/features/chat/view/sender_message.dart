import 'package:flutter/material.dart';
import 'package:food_app/core/utils/models/message_model.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

class SenderMessage extends StatelessWidget {
  const SenderMessage({super.key, required this.model});

  final MessageModel model;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: IntrinsicWidth(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
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
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                          color: ColorManager.primaryColor,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(10.0),
                            topEnd: Radius.circular(10.0),
                            bottomStart: Radius.circular(10.0),

                          )
                      ),
                      child: Text(model.text!,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.white,
                          fontSize: 14
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0,),
                    const CircleAvatar(
                      radius: 27,
                      backgroundColor: ColorManager.pink,
                    )
                  ],
                ),



            ],
          ),
        ),
      ),
    );
  }
}
