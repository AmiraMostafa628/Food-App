import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/models/message_model.dart';
import 'package:food_app/core/utils/resources/constants.dart';
import 'package:food_app/features/chat/view_model/chat_states.dart';

class ChatCubit extends Cubit<ChatStates>{

  ChatCubit() : super(ChatInitialStates());

  static ChatCubit get(context) => BlocProvider.of(context);


  void sendMessage(
      {
        required String receiverId,
        required String dateTime,
        required String text,
        String? messageTime,
      }
      )
  {
    MessageModel model = MessageModel(
        senderId: uId,
        receiverId: receiverId,
        dateTime: dateTime,
        text: text,
      messageTime: messageTime,

    );
    // set my chats

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap()!)
        .then((value) {
      emit(SendMessageSuccessStates());
    })
        .catchError((error){
      emit(SendMessageErrorStates());
    });

    // set receiver chats
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(uId)
        .collection('messages')
        .add(model.toMap()!)
        .then((value) {
      emit(SendMessageSuccessStates());
    })
        .catchError((error){
      emit(SendMessageErrorStates());
    });

  }


  List <MessageModel> messages=[];

  void getMessages({ required String receiverId,})
  {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages=[];
      for (var element in event.docs) {
        messages.add(MessageModel.fromJson(element.data()));
        if (kDebugMode) {
          print(element.data()['text']);
        }

      }
      emit(GetAllMessagesSuccessStates());
    });

  }

}