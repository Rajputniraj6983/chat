import 'package:chat/modal/modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices{
  static UserServices userServices = UserServices._();
  UserServices._();

  Future<void> addUser(Modal sing)
  async {
    CollectionReference user = FirebaseFirestore.instance.collection('user');
    await user.doc(sing.email).set(sing.toMap(sing));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUser()
  {
    var user = FirebaseFirestore.instance.collection('user').snapshots();
    return user;
  }

  DocumentReference<Object?> cureentUser(Modal sign)
  {
    CollectionReference user= FirebaseFirestore.instance.collection('user');
    return user.doc(sign.email);
  }
}