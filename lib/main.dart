import 'package:chat/controller/firebase_messaging_service.dart';
import 'package:chat/controller/notification.dart';
import 'package:chat/controller/notification_services.dart';
import 'package:chat/view/screen/chat_screen.dart';
import 'package:chat/view/screen/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/screen/Homescreen.dart';
import 'view/screen/sign_up.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  // NotificationServices.notificationServices.initNotification();
  // await FirebaseMessagingServices.firebaseMessagingServices.requestPermission();
  // await FirebaseMessagingServices.firebaseMessagingServices.generateDeviceToken();
  // ApiService.apiService.getServerToken();
  // FirebaseMessagingServices.firebaseMessagingServices.onMessageListener();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
      
    );
  }
}
