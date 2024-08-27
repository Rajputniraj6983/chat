import 'package:chat/view/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text('Get Closer To',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.w900),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text('Everyone',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.w900),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Helps you to contact everyone with',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('just easy way',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
          ),SizedBox(height: 20),
          Center(child: Image.asset('assets/Dayflow Best Friends.jpg')),SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 10,width: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey.shade600),),SizedBox(width: 1),
              Container(height: 10,width: 15,decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffD9D9D9)),),SizedBox(width: 1),
              Container(height: 10,width: 15,decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffD9D9D9)),),SizedBox(width: 1),
              Container(height: 10,width: 15,decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffD9D9D9)),),
            ],
          ),SizedBox(height: 40),
          Center(child: Container(height: 50,width: 300,child: Center(child: InkWell(onTap: () {
            Get.to(const LoginPage(),transition: Transition.leftToRightWithFade);
          },child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 20),))),decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xff771F98)),))
        ],
      ),
    );
  }
}
