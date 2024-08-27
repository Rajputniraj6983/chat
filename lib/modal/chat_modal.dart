import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String? sender, receiver, message;
  Timestamp? timestamp;

  Chat._({
    required this.sender,
    required this.message,
    required this.receiver,
    required this.timestamp,
  });

  factory Chat(Map json) {
    return Chat._(
        sender: json['sender'],
        receiver: json['receiver'],
        message: json['message'],
        timestamp: json['timestamp']);
  }

  Map<String, dynamic> toMap(Chat chat) {
    return {
      'sender': chat.sender,
      'receiver': chat.receiver,
      'message': chat.message,
      'timestamp': chat.timestamp
    };
  }
}