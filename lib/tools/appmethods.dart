

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppMethods{
  Future <String>logginUser({String email,String password});
   Future <String>createUserAccount({ String fullname, String email, String phoneNumber,String password});
   Future <bool> logoutUser();
   Future <DocumentSnapshot> getUserInfo(String userid);


}