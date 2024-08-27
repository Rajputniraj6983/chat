import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
 static AuthServices authServices = AuthServices._();
 AuthServices._();

 final FirebaseAuth auth = FirebaseAuth.instance;

 Future<void> createAcc(String mail, String pass) async {
  UserCredential userCredential =
  await auth.createUserWithEmailAndPassword(email: mail, password: pass);
  print(userCredential.user!.email);
 }

 Future<String> loginApp(String mail, String pass) async {
  try{

   UserCredential userCredential =
   await auth.signInWithEmailAndPassword(email: mail, password: pass);
   print(userCredential.user!.email);
   getCurrentUser();
   return 'Success';
  }catch(e)
  {
   return 'fail';
  }

 }
 User? getCurrentUser()
 {
  User? user = auth.currentUser;
  print("${user!.email}------------------------------------------------------------------");
  return user;
 }
}