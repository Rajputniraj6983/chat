import 'package:chat/controller/firebase_messaging_service.dart';

class Modal {
  String? name, email, token;

  Modal({required this.name, required this.email, required this.token});

  factory Modal.fromJson(Map m1) {
    return Modal(name: m1['name'], email: m1['email'], token: m1['token']);
  }

  Map<String, dynamic> toMap(Modal modal) {
    return {
      'name': modal.name ?? 'niraj',
      'email': modal.email ?? 'niraj@gmail.com',
      // 'token':modal.token??FirebaseMessagingServices.firebaseMessagingServices.generateDeviceToken()
    };
  }
}
