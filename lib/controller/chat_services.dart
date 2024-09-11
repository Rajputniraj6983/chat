import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  static ChatServices chatServices = ChatServices._();

  ChatServices._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> insertData(Map<String, dynamic> chat, String sender,
      String receiver) async {
    List doc = [sender, receiver];
    doc.sort();
    String docId = doc.join('_');
    await firestore.collection('chatbox').doc(docId).collection('chat').add(
        chat);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChat(String sender,
      String receiver) {
    List doc = [sender, receiver];
    doc.sort();
    String docId = doc.join('_');
    return firestore.collection('chatbox').doc(docId)
        .collection('chat')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
  void updateChat(String message, String chatId, String sender,
      String receiver) {

    List doc = [sender, receiver];
    print("$sender----------------------------------------------------$receiver $message");
    doc.sort();
    String docId = doc.join('_');
    FirebaseFirestore.instance
        .collection('chatbox')
        .doc(docId)
        .collection('chat')
        .doc(chatId)
        .update({
      'message': message,
    });
  }

  void deleteChat(String chatId, String sender,
      String receiver) {
    List doc = [sender, receiver];
    print("$sender----------------------------------------------------$receiver ");
    doc.sort();
    String docId = doc.join('_');
    FirebaseFirestore.instance
        .collection('chatbox')
        .doc(docId)
        .collection('chat')
        .doc(chatId)
        .delete();
  }
}


