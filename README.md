# 🗨️ Chat Application
A simple chat application built with Flutter and Firebase, supporting real-time messaging, authentication, and push notifications using Firebase services.

## 🚀 Features
### Firebase Authentication: User sign-in and sign-up with email and password.
### Real-Time Messaging: Chat with real-time updates using Firebase Firestore.
### Push Notifications: Receive notifications for new messages via Firebase Cloud Messaging (FCM).

## 🛠️ Tech Stack
### Framework: Flutter
### Backend: Firebase (Authentication, Firestore, Cloud Messaging)
### State Management: Getx
## ⚙️ Firebase Setup
1. Create Firebase Project
Go to Firebase Console and create a new project.
Add your Android and/or iOS app to the Firebase project.
Download and add the Firebase configuration files:
google-services.json for Android: Place in android/app/.
GoogleService-Info.plist for iOS: Place in ios/Runner/.
2. Enable Firebase Services
Authentication: Go to Firebase Console > Authentication > Sign-in method > Enable Email/Password.
Firestore Database: Set up a Firestore database in production or test mode.
Firebase Cloud Messaging: Enable FCM for push notifications.
📝 Installation

1. Clone the Repo
```
bash
Copy code
git clone https://github.com/yourusername/chat-app.git
cd chat-app
```
2. Install Dependencies
 ```
bash
Copy code
flutter pub get
```
4. Run the App
Ensure you have an emulator running or a physical device connected, then run:
```

bash
Copy code
flutter run
```
🔥 Firebase Integration
Firebase Authentication
Manages user registration and login via firebase_auth.
Provides basic email/password authentication.
dart
```
Copy code
FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
```
Firebase Firestore
Stores and retrieves real-time messages.
Messages are stored in a chats collection with fields like senderId, message, and timestamp.
dart
```
Copy code
FirebaseFirestore.instance.collection('chats').add({
  'senderId': senderId,
  'message': message,
  'timestamp': FieldValue.serverTimestamp(),
});
```
Firebase Cloud Messaging (FCM)
Push notifications alert users of new messages, even when the app is in the background or closed.
dart
```
Copy code
FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  // Handle in-app message notifications
});
------------------------------------------------------------------

------------------------------------------------------------------
## 📦 Dependencies
yaml
-----
Copy code
dependencies:
  flutter:
    sdk: flutter
  firebase_core: latest_version
  firebase_auth: latest_version
  cloud_firestore: latest_version
  firebase_messaging: latest_version
-----
## ✨ Firebase Packages Used
-----
firebase_core: Initializes Firebase.
firebase_auth: Authentication services.
cloud_firestore: Firestore database.
firebase_messaging: Push notifications.
```

## ScreenShot

<p align='center'>
<img src = "https://github.com/user-attachments/assets/25df5de2-00f5-4df5-891b-15f1a3988d27" height = 400>
<img src = "https://github.com/user-attachments/assets/b621b8ac-6935-4237-a43d-273f3a29fd16" height = 400>
<img src = "https://github.com/user-attachments/assets/37abe79c-eca3-43d8-be3a-30ba096026c2" height = 400>
<img src = "https://github.com/user-attachments/assets/d30192f8-b203-408b-8ad4-c91cf1a97312" height = 400>
<img src = "https://github.com/user-attachments/assets/7a285c3a-dba6-4cb5-a10d-e11ce6fa0be9" height = 400>
<img src = "https://github.com/user-attachments/assets/89caeff4-7371-45d5-8f10-2bd1f9ef68d0" height = 400>  
</p>  
  
</p>

## Video


https://github.com/user-attachments/assets/ed450217-7b18-4478-959b-87da9fe8d14f

https://github.com/user-attachments/assets/961874b4-e6df-43aa-a352-5f54c35d9457






