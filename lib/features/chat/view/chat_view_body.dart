import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/models/message_model.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/constants.dart';
import 'package:food_app/core/utils/shared_widgets/arrow_back_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_text_form_field.dart';
import 'package:food_app/features/chat/view/receiver_message.dart';
import 'package:food_app/features/chat/view/sender_message.dart';
import 'package:food_app/features/chat/view_model/chat_cubit.dart';
import 'package:food_app/features/chat/view_model/chat_states.dart';
import 'package:intl/intl.dart';

class ChatViewBody extends StatelessWidget {
    ChatViewBody({super.key});

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit,ChatStates>(
        builder: (context,state){
          ChatCubit.get(context).getMessages(receiverId: receiverUid);
          DateTime now = DateTime.now();
          String formattedTime = DateFormat.jm().format(now);
          return Column(
            children: [
              Row(
                children: [
                  const ArrowBackButton(icon:Icons.close),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Robert Fox',
                    style:
                    Theme
                        .of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                      color: ColorManager.restaurantTitleColor,
                      fontSize: 17,
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 30,),
              Expanded(
                child: ConditionalBuilder(
                  condition: ChatCubit.get(context).messages.isNotEmpty,
                  builder: (context)=> Expanded(
                    child: ListView.builder(
                        itemBuilder: (context,index){
                          MessageModel message = ChatCubit.get(context).messages[index];
                          if(uId==message.senderId) {
                            return SenderMessage(model: message,);
                          }

                          return ReceiverMessage(model: message,);
                        },
                        itemCount: ChatCubit.get(context).messages.length),
                  ),
                  fallback: (context)=>Container(),
                ),
              ),
              const SizedBox(height: 20.0,),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0
                ),
                child: CustomTextFormField(
                  text: 'Write somethings',
                  color: ColorManager.fillTextFieldColor,
                  type: TextInputType.text,
                  textEditingController: messageController,
                  suffixIcon:  FontAwesomeIcons.paperPlane,
                  suffixColor: ColorManager.primaryColor,
                  suffixPressed: (){
                    if(messageController.text.isNotEmpty){
                      ChatCubit.get(context).sendMessage(
                          receiverId: receiverUid,
                          dateTime: DateTime.now().toString(),
                          messageTime: formattedTime,
                          text: messageController.text);
                      messageController.clear();
                    }
                  },

                ),
              ),

            ],
          );
        });
  }
}
