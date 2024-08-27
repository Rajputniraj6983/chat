
import 'package:chat/controller/singin_controller.dart';
import 'package:chat/controller/user_services.dart';
import 'package:chat/modal/modal.dart';
import 'package:chat/view/screen/Homescreen.dart';
import 'package:chat/view/screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.txtUser,
              decoration: const InputDecoration(hintText: 'Username',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.txtEmail,
              decoration: const InputDecoration(hintText: 'E-mail',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.txtPass,
              decoration: const InputDecoration(hintText: 'Password',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(onPressed: () {
            controller.signUp(controller.txtEmail.text, controller.txtPass.text);
            Map<String,dynamic> m1={
              'name':controller.txtUser.text,
              'email':controller.txtEmail.text,
            };

            Modal sign = Modal.fromJson(m1);
            UserServices.userServices.addUser(sign);
            Get.to(Homescreen());
           }, child: const Text("Create Acc"),
          ),const Spacer(),
          InkWell(onTap: () {
            Get.to(const LoginPage(),transition: Transition.circularReveal);
          },child: const Text("Already have a account ? Sign in",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}