import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
 static AuthServices authServices = AuthServices._();
  AuthServices._();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> CreateAcc(String mail,String password)
  async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: mail, password: password);
  }
}