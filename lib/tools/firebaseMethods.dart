import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kinsapp/tools/apptools.dart';
import 'dart:async';
import 'app_data.dart';
import 'package:flutter/services.dart';
import 'package:kinsapp/tools/appmethods.dart';

class FirebaseMethods implements AppMethods {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<String> createUserAccount(
      {String fullname,
      String email,
      String phoneNumber,
      String password}) async {
    FirebaseUser user;
    try {
      user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        await firestore.collection(userData).document(user.uid).setData({
          userID: user.uid,
          acctFullName: fullname,
          userEmail: email,
          acctNumber: phoneNumber,
          userPassword:password
        });

        writeDataLocally(key: userID, value: user.uid);
        writeDataLocally(key: acctFullName, value: fullname);
        writeDataLocally(key: userEmail, value: userEmail);     
        writeDataLocally(key: acctNumber, value: phoneNumber);
        writeDataLocally(key: userPassword, value: password);
      }
    } on PlatformException catch (e) {
      return errorMSG(e.details);
    }
    return user == null ? errorMSG("Error") : successfulMsg();
  }

  @override
  Future<String> logginUser({String email, String password}) async {
    FirebaseUser user;

    try {
      user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        DocumentSnapshot userInfo = await getUserInfo(user.uid);
        await writeDataLocally(key: userID, value: userInfo[userID]);
        await writeDataLocally(
            key: acctFullName, value: userInfo[acctFullName]);
        await writeDataLocally(key: userEmail, value: userInfo[userEmail]);
        await writeDataLocally(key: acctNumber, value: userInfo[acctNumber]);
        await writeDataLocally(key: photoUrl, value: userInfo[photoUrl]);
        await writeBoolLocally(key: isLoggedIN, value: true);
      }
    } on PlatformException catch (e) {
      print(e);
      return errorMSG(e.details);
    }
    return user == null ? errorMSG("error") : successfulMsg();
  }

  Future<bool> complete() async {
    return true;
  }

  Future<bool> notComplete() async {
    return false;
  }

  Future<String> successfulMsg() async {
    return successful;
  }

  Future<String> errorMSG(String e) async {
    return e;
  }

  @override
  Future<bool> logoutUser() async {
    await auth.signOut();
    await clearDataLocally();

    return complete();
  }

  @override
  Future<DocumentSnapshot> getUserInfo(String userid) async {
    return await firestore.collection(userData).document(userid).get();
  }
}
