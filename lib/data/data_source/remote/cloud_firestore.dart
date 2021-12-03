// TODO create Cloud firestore service class
// TODO create function inside this class to SAVE user data into firebase firestore
// TODO create function inside this class to GET user data from firebase firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nash_code/data/data_source/local/user_model.dart';
import 'package:nash_code/ui/shared/app_strings.dart';

class CloudFirestoreService {
  static FirebaseFirestore _fireStoreInstance;

  CloudFirestoreService() {
    _fireStoreInstance = FirebaseFirestore.instance;
  }

  Future<String> getDataFromServer() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Nash';
  }

  static Future<void> saveUserInfo({@required User user}) async =>
      await _fireStoreInstance
          .collection(kUserCollectionName)
          .doc(user.userID)
          .set({
        kUserID: user.userID,
        kUserName: user.userName,
        kUserPhone: user.userPhone,
        kUserEmail: user.userEmail,
        kUserPassword: user.userPassword,
      });
  //=================================
  //authenticationAndSaveUser(){
  //
  // }

  //=================================
  static Future<QuerySnapshot> getUserData() async {
    return await _fireStoreInstance.collection(kUserCollectionName).get();
  }
}
