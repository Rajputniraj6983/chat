//import 'package:chat/controller/user_services.dart';
import 'package:chat/controller/singin_controller.dart';
import 'package:chat/controller/user_services.dart';
import 'package:chat/modal/data.dart';
import 'package:chat/view/screen/chat_screen.dart';

//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:chat/controller/singin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';

class Homescreen extends StatefulWidget {
   Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF1F1F1),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              height: 60,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.search, size: 30),
                    SizedBox(width: 10),
                    Text(
                      'Search Chat',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.document_scanner_rounded,
                      size: 25,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xffF1F1F1),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Chats',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Friends',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Calls',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder(
                stream: UserServices.userServices.getUser(),
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
                  return ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        auth.getReceiverData(chats[index]['email']);
                        Get.to(ChatScreen(),
                            transition: Transition.circularReveal);
                      },
                      child: Container(
                        height: 85,
                        width: 380,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage('assets/images.jfif'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chats[index]['email'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    'hlo',
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '2:35',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.purple.shade50,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),

          ),
        ),
        child: NavigationBar(
          height: 70,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(icon: Icon(Icons.chat_sharp), label: 'Chats'),
            NavigationDestination(icon: Icon(Icons.update), label: 'Update'),
            NavigationDestination(icon: Icon(Icons.person_2_rounded), label: 'Communities'),
            NavigationDestination(icon: Icon(Icons.phone), label: 'Calls'),
          ],
        ),
      ),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:chat/controller/singin_controller.dart';
// import 'package:chat/controller/chat_services.dart';
// import 'package:chat/controller/singin_controller.dart';
// import 'package:chat/modal/chat_modal.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Homescreen extends StatelessWidget {
//    Homescreen({super.key});
//   AuthController controller = Get.put(AuthController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Color(0xffF1F1F1),
//         automaticallyImplyLeading: false,
//        title: Text('App Bar'),
//       ),
//       body: Column(
//         children: [
//           Expanded(child: StreamBuilder(stream: ChatServices.chatServices.getChat(),
//               builder: (context, snapshot){
//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Text(snapshot.error.toString()),
//                   );
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 var queryData = snapshot.data!.docs;
//                 List chats = queryData.map((e) => e.data()).toList();
//                 List<Chat> chatList = chats.map((e) => Chat(e)).toList();
//                 return Container(
//                   width: double.infinity,
//                   child: Column(mainAxisAlignment: MainAxisAlignment.end,
//                     children: List.generate(chatList.length, (index) =>  Align(
//                       alignment: Alignment.centerRight,
//                       child: Card(child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(chatList[index].message!),
//                       )),
//                     ),)
//                   ),
//                 );
//               },
//           ),
//           ),
//           TextField(
//            controller: controller.txtMsg,
//            decoration: InputDecoration(
//             suffixIcon: IconButton(onPressed: () {
//                Map<String, dynamic> chat = {
//                 'sender': "currentUser",
//                  'receiver': 'receiver',
//                   'message' : controller.txtMsg.text,
//                    'timestamp': DateTime.now()
//            };
//                ChatServices.chatServices.insertData(chat);
//                controller.txtMsg.clear();
//                },icon: Icon(Icons.send)),
//                border: OutlineInputBorder()
//            )
//           )
//         ]
//       )
//     );
//   }
// }
