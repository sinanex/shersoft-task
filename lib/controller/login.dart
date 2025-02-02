import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shersoft/controller/localdb.dart';
import 'package:shersoft/model/localdb.dart';
import 'package:shersoft/view/login&register/login.dart';

class UserController extends ChangeNotifier {
  final FirebaseAuth authentication = FirebaseAuth.instance;
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

   String? uid;

  Future<String?> loginUser(
      {required String email, required String password}) async {
    try {
      await authentication.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("login success");
      notifyListeners();
      return "success";
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
    return null;
  }

  Future<String?> registerUser(
      {required String email,
      required String password,
      required String name,
      required String address,
      required String phone}) async {
    if (email.isEmpty ||
        phone.isEmpty ||
        address.isEmpty ||
        password.isEmpty ||
        name.isEmpty) {
      log("empty");
    }
    try {
      UserCredential userCredential = await authentication
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
          "address": address,
          "company": name,
          "phone": phone,
        });
      }
      log("register success");
      return "register success";
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> getUserMetaData() async {
    final user = FirebaseAuth.instance.currentUser;

    try {
      if (user != null) {
        uid = user.uid;
        log(user.uid);
        final docs = await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .get();
        if (docs.exists) {
          log(docs.data().toString());
        }
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Future<void> addAccounts(
      {required String email, required String password}) async {
    final data = UserAcoountDb(email: email, password: password);
    addData(data);
  }

  void logoutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false,
      );
    } catch (e) {
      print("Logout Error: $e");
    }
  }
}
