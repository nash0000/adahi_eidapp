import 'package:adahi_eidapp/models/butcher_model.dart';
import 'package:adahi_eidapp/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  static FirebaseAuth _auth;

  AuthenticationService() {
    _auth = FirebaseAuth.instance;
  }

  static Future<UserCredential> signUp({
    @required UserModel userModel,
  }) async =>
      await _auth.createUserWithEmailAndPassword(
          email: userModel.userEmail, password: userModel.userPassword);

  static Future<UserCredential> signIn({
    @required UserModel userModel,
  }) async =>
      await _auth.signInWithEmailAndPassword(
          email: userModel.userEmail, password: userModel.userPassword);
}
