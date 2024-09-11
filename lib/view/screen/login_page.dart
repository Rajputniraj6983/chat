import 'package:chat/view/screen/Homescreen.dart';
import 'package:chat/view/screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/singin_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());

    return Scaffold(
      appBar:  AppBar(automaticallyImplyLeading: false,),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello, Welcome Back", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                  // Image.asset('assets/Dayflow Sitting.jpg')
                  Text("Happy to see you again,to use your", style: TextStyle(color: Colors.black, fontSize: 18,),),
                  Text("account please login first", style: TextStyle(color: Colors.black, fontSize: 18,),),SizedBox(height: 30),
                      TextField(controller: controller.txtEmail,decoration: InputDecoration(hintText: "E-mail", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),),),
                       SizedBox(height: 25),
                        TextField(controller:controller.txtPass,decoration: InputDecoration(hintText: "Password",border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),),),
          SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 230),
                    child: Text("Forgot Password", style: TextStyle(color: Colors.red,fontSize: 15,),),
                  ),
                  SizedBox(height: 30),
                  InkWell(
            onTap: () async {
              String status=await controller.signIn(controller.txtEmail.text, controller.txtPass.text);
              if(status=='Success')
                {
                  Get.to(Homescreen(),transition: Transition.leftToRightWithFade);
                }
            },
            child: Center(
              child: Container(
                height: 50,
                width: 340,
                child: Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Login",
                          style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff771F98)
                ),
              ),
            ),
          ),Spacer(),
                 Center(child: Text("----- or Login with -----",style: TextStyle(fontSize: 15),)),Spacer(),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                    Image.asset('assets/Vector__1_-removebg-preview.png'),
                    Image.asset('assets/XMLID_17_-removebg-preview.png'),
                   ],
                 )

          // InkWell(onTap: () {
          //   Get.to(SignUp(),transition: Transition.circularReveal);
          // },child: Text("Don't have an Account? Sign up",style: TextStyle(color: Colors.black,fontSize: 15),)),
                ],
              ),
        ));
  }
}
