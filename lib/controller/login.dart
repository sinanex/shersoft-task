import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController adreesController = TextEditingController();
  final FirebaseAuth authentication = FirebaseAuth.instance;

  Future<void> loginUser() async {
    try {
      await authentication.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      log("login success");

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided.');
      } else {
        log('Error: ${e.code}');
      }

      notifyListeners();
    } catch (e) {
      log('Error: $e');
      notifyListeners();
    }
  }

  Future<String?> registerUser() async {
    try {
    UserCredential userCredential = await authentication.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
          User? user = userCredential.user;
          if(user != null){
            user.updateProfile();
          }
      log("register success");
      return "register success";
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }
}
