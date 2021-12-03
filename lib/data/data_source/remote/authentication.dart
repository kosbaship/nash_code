import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nash_code/data/data_source/local/user_model.dart';

class AuthenticationService {
  static FirebaseAuth auth;

  AuthenticationService() {
    auth = FirebaseAuth.instance;
  }

  static Future<UserCredential> signUp({@required user}) async =>
      await auth.createUserWithEmailAndPassword(
          email: user.userEmail, password: user.userPassword);

  static Future<UserCredential> signIn({@required user}) async =>
      await auth.signInWithEmailAndPassword(
          email: user.userEmail, password: user.userPassword);

  static Future<void> signOut() async {
    await auth.signOut();
  }

  static getUserID() {
    return auth.currentUser.uid;
  }
}
