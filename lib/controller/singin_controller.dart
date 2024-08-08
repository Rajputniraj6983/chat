import 'package:chat/controller/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SinginController extends GetxController {

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  void singUp(String email,String password){
    AuthServices.authServices.CreateAcc(email,password);
  }
}