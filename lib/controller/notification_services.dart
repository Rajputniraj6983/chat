// import 'dart:convert';
// import 'dart:developer';
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
//
// import 'package:firebase_messaging/firebase_messaging.dart';
//
//
// class ApiService {
//   ApiService._();
//
//   static ApiService apiService = ApiService._();
//
//   FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//
//   static const String baseUrl =
//       'https://fcm.googleapis.com/v1/projects/chat-b2904/messages:send';
//
//   Future<String> getServerToken() async {
//     final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
//     final privateKey = jsonEncode(appJson);
//     final client = ServiceAccountCredentials.fromJson(privateKey);
//
//     final servicesClient = await clientViaServiceAccount(client, scopes);
//
//     String serverToken = servicesClient.credentials.accessToken.data;
//     log("Server Token: \n $serverToken \n \n");
//     return serverToken;
//   }
//
//   // onclick method call
//   Future<void> sendMessage(String title, String body, String token) async {
//     Map notification = {
//       "message": {
//         "token": token, // Use a valid FCM token here
//         "notification": {
//           "title": title,
//           "body": body,
//         },
//         "data": {"response": "Message Done !"}
//       }
//     };
//
//     final jsonNotification = jsonEncode(notification);
//
//     try {
//       // String serverToken = getServerToken().toString();
//       String serverToken =
//       // 'ya29.a0AcM612zxzUJjOmpZFKh-EOVGj5sYJh5sJjGuJUqkxQ6OG0ZcsX2c8_fm8es8P78i-N32qh3lh1_uRtsTXNfiUtUXQMxiUSQ5J1qJg_xu9lzLMeiJIkD-NgsJ0T7YFqkTVqQUeGj9a6agnuyDO9nA4553u1bvFPKl-HuaBvjOaCgYKAbkSARESFQHGX2MiR2yCd3zKjc8-CSaYzLJWlg0175';
//           'ya29.a0AcM612yOYUmywhry3Pjn0DqpEu1zss-eVTTmjLOB6nc5ehU6-8naGs6H_LiVeNEADyqxHC2ViFhZjm5PbScqs4ID7fdIWWDQFqlntdIG0Qa7oLT3jrV_9bHU92TvO5XwNOc_BOy7GUNppDsG8vdM5W23kZsG5RIGWU11gxl9aCgYKAaUSARESFQHGX2Mi-1zMt9gM9Lc6uQOSjPSpyg0175';
//       log('$title----------------------------$body-------------$token');
//       var response = await http.post(Uri.parse(baseUrl),
//           body: jsonNotification,
//           headers: <String, String>{
//             'Authorization': 'Bearer $serverToken',
//             'Content-Type': 'application/json',
//           });
//
//       if (response.statusCode == 200) {
//         log('Successfully sent message: ${response.body}');
//       } else {
//         log('Error sending message: ${response.body}');
//       }
//     } catch (e) {
//       log("Api error: ${e.toString()}");
//     }
//   }
// }
//
// String serverKey =
//     'ya29.a0AcM612yjKnlVrB3hAHxcDu61pMUe5_f2l8MrwrUHgmIm7bv-yq5F_zs9xgS-gZ5_9HLq0u54RfVtQehas3pNKx6a5MuH66G0OCdkYJMW6vl9u0VMY75zmnNZ_pi1z85BaXWuHy4hMvhdQjOuOp1j6VImSFnLYVpkg_x1ZaCmaCgYKAeYSARESFQHGX2Mi7BJTg5-rCp1Y6937FWmlxg0175';
// final appJson = {
//   "type": "service_account",
//   "project_id": "chat-b2904",
//   "private_key_id": "6d0b7f9c477a031756632241c6fdd66a3132bc91",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC8JdqrIbygmAEa\nHYtOSFaEPv0J8MIDNGmhL/W4HHAZISAZSm9HpmRg1rCXplSiWerqTS+SJ79lPVEp\nqIGo7HpDnIwOt26WBPancBjZSGIypmqIko6XS6sIXyg8fZ8wqKFPzZ64pTnokXvE\nVZI31kEiv/XxbjkvV5V//L70JZXr2sB3OQE8ZFgl4FMgLpHstbG6GpazGtPgnSW0\nemeYZGfjVaulwD+IBCtVrnhqgo+MLYXT7AWKf0dtABEknL2GAJPr3PvlAL5e7l5I\nIPenVXI6Nxhe6qUoAuQ1B1T4X84KKjc852OD75ysg/4dBRRSgCHpfHA0o9rJX0yT\nCoduUEUFAgMBAAECggEAEVcLyCnb0JExyM5gQF66WoXTnE7sEo+KDKj25Hj6e9Zp\ntur9RoU3SxV+QPu7YRsYY2+pqravFQ2JpWU6Te89dW3AGrsdHgZnFRdnst7Q7goY\nV23qZlc69BKRCsIpIbro4wn4Ttwrchu2ZGneh/bfGezHJfEapBpWVO1eS/IK1ymx\neUTZ9i/DnFvI9P6QJxqGjnypxXIgz/YwDjolwIsLvEryP5gjrdUIuxmP1fI2r6ep\n9HGuvp4A0symqD6EDVIb8A5ulfYF5cb/zoH9fXnfxEZDD9zZPTLY4iYwGLyl1z3n\npJi61eyc91/1baaIPpsO8MaH0eLaxFNZwyzOUrtsIQKBgQDqN6/mbTGHw4Yoncvd\n0TbIeAhUX6VUmmyQxvLJvBrx0F4sM8yj2VXSR6xJiIzoC3xsenotC/NZUZSQCkJF\ngm4o1HP6AaoibqvwOIPVmX6cxC7KhvYGsvwwNaYFSxyFFK2y8rk1SyJ5BFeDIrgB\nmwpU0581A9CJdNEKWIOpHgGSBwKBgQDNpVQSivjBoRs2WAWUVV0aYXf4UZksc6r8\nfzzaGfbimv2puLd0GMfW2FZ84+g77/pFQTdj1y61cqswMjVT6Nz2BP/zzMOghkLf\nE/ISI+fngqlkTUdOWWNZ7ndBezfRGfKPtlQuR2eiTRfus/HzpKvRVLMpM8OF69yq\nYu/q4QR9kwKBgEZqPYjiNSzi3JejcSIb/wNgCukK5FK+JnuURHPgCJ3Ajj9tx01P\nTtzsTWDCG9K7eUnHvKmEWUH2I9r2KpxpLSM7VC7Kh1LYwPp0kzYJcqZA2OxsjNTQ\nxL7dsi8POODNqbcOAB6EmzWU15aGPpnE+eMsyEWRAwYAR8R7fgG/EqvLAoGAQkvy\ndqfm2kWeCD8ITXHXuhGCI8PqpbIEhbJfY9DLDvL4pCawvfTfOBw2hbzTub776CfG\nO6G7pTN6jOci2hJQad/ixC5XQwEFvfUoLUD2GmS9R2DChDe9F9kRCUM4E2lSEZKu\nQN00Q9amyIWqkumbmri7qaTOe/Y2BZgv0IEKeZECgYAi0kTbdNzscBkOKEgdzex/\nwHd3fk5P9lsqXTttZ6w80FPZomjoxLdUXi0bkcKPzKZ3YA3zCXZp4bo3a9wLUmBz\nfzeztTyrfFcaVSRraJ3xUOqgWkSwOLH/u19dkwA/GEcqTnh2l7uLd76mpqrp2rNp\nncL9zNl/gEwisw69DDxdHQ==\n-----END PRIVATE KEY-----\n",
//   "client_email": "firebase-adminsdk-wmxgz@chat-b2904.iam.gserviceaccount.com",
//   "client_id": "110513029072986738195",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-wmxgz%40chat-b2904.iam.gserviceaccount.com",
//   "universe_domain": "googleapis.com"
// };