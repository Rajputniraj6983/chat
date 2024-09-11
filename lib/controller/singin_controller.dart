import 'package:chat/controller/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
   RxString  receiverEmail = ''.obs;
   RxString  receiverToken = ''.obs;
   RxString  email = ''.obs;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtMsg = TextEditingController();
  TextEditingController txtEdit = TextEditingController();


  void signUp(String email, String pass){
    AuthServices.authServices.createAcc(email, pass);
  }

  Future<String> signIn(String email,String pass)
  {
   return  AuthServices.authServices.loginApp(email, pass);
  }

  void getReceiverData(String email,)
  {
    receiverEmail.value = email;
    //receiverToken.value = token;
  }
}