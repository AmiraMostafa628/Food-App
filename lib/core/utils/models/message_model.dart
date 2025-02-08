class MessageModel{
  String? senderId;
  String? receiverId;
  String? dateTime;
  String? messageTime;
  String? text;


  MessageModel({
    this.senderId,
    this.receiverId,
    this.dateTime,
    this.messageTime,
    this.text,

  });
  MessageModel.fromJson(Map<String,dynamic>json)
  {
    senderId=json['senderId'];
    receiverId=json['receiverId'];
    dateTime=json['dateTime'];
    messageTime=json['messageTime'];
    text =json['text'];
  }

  Map<String,dynamic>? toMap()
  {
    return
      {
        'senderId'  : senderId,
        'receiverId' : receiverId,
        'dateTime' : dateTime ,
        'messageTime' : messageTime,
        'text' : text,

      };

  }

}