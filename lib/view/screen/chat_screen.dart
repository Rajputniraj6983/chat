import 'package:chat/controller/auth_services.dart';
import 'package:chat/controller/chat_services.dart';
import 'package:chat/controller/singin_controller.dart';
import 'package:chat/modal/chat_modal.dart';
import 'package:chat/view/screen/Homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});


  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        leading: InkWell(onTap: () {
          Get.to(Homescreen(), transition: Transition.circularReveal);
        }, child: const Icon(Icons.arrow_back, color: Colors.black, size: 25)),
        title: const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images.jfif'),
        ),
        actions:  [
          Column(
            children: [
              Obx(
                ()=> Text(
                  controller.receiverEmail.value,
                  style: TextStyle(color: Colors.black, fontSize: 20,),
                ),
              ),
              Text(
                'online',
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            ],
          ),
          SizedBox(width: 120),
          Icon(Icons.video_camera_back, color: Colors.grey, size: 25),
          SizedBox(width: 15),
          Icon(Icons.call, color: Colors.grey, size: 25),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(stream: ChatServices.chatServices.getChat(
                AuthServices.authServices.getCurrentUser()!.email!,
                controller.receiverEmail.value),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var queryData = snapshot.data!.docs;
                List chats = queryData.map((e) => e.data()).toList();
                List chatId = queryData.map((e) => e.id,).toList();
                List<Chat> chatList = chats.map((e) => Chat(e)).toList();

                return SingleChildScrollView(scrollDirection: Axis.vertical,
                  child: Container(
                    width: double.infinity,
                    color: Colors.black,
                    child: Column(mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(chatList.length, (index) =>
                          Align(
                            alignment: chatList[index].sender! == AuthServices
                                .authServices.getCurrentUser()!.email
                                ? Alignment.bottomRight
                                : Alignment.bottomLeft,
                            child: GestureDetector(
                              onLongPress: () {
                                controller.txtEdit = TextEditingController(
                                     text: chatList[index].message);
                                if(chatList[index].sender==AuthServices.authServices.getCurrentUser()!.email!)
                                {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('edit'),
                                      content: TextField(
                                        controller: controller.txtEdit,
                                      ),
                                      actions: [
                                        TextButton(onPressed: () {
                                          // ChatServices.chatServices.updateChat(
                                          //     controller.txtEdit.text,
                                          //     chatId[index],
                                          //     controller.email.value, controller.receiverEmail.value);
                                          ChatServices.chatServices.updateChat(
                                              controller.txtEdit.text, chatId[index], AuthServices.authServices.getCurrentUser()!.email!, controller.receiverEmail.value);
                                          Get.back();

                                          }, child: Text('edit')),
                                        GestureDetector(onTap: () {
                                          ChatServices.chatServices.deleteChat(
                                              chatId[index], AuthServices.authServices.getCurrentUser()!.email!, controller.receiverEmail.value);
                                          Get.back();
                                        },child: Text("delete")),
                                      ],
                                    );
                                  },
                                );
                                  }
                              },
                              child: Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(chatList[index].message!),
                              ),
                              ),
                            ),
                          ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: controller.txtMsg,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: () {
                    Map<String, dynamic> chat = {
                      'sender': AuthServices.authServices.auth.currentUser!.email!,
                      'receiver': controller.receiverEmail.value,
                      'message': controller.txtMsg.text,
                      'timestamp': DateTime.now()
                    };
                    ChatServices.chatServices.insertData(chat,
                        AuthServices.authServices.auth.currentUser!.email!,
                        controller.receiverEmail.value);
                    controller.txtMsg.clear();
                  }, icon: const Icon(Icons.send)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),),),
                )
            ),
          ),

        ],
      ),
    );
  }
}
