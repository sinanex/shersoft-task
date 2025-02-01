import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shersoft/controller/login.dart';
import 'package:shersoft/view/home/homepage.dart';
import 'package:shersoft/view/login&register/widget/widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue[700]!, Colors.blue[400]!]),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Consumer<UserController>(
                builder: (context, value, child) => Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Register",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    loginform(
                        controller: value.emailController, lable: "Email"),
                    loginform(
                        controller: value.passwordController,
                        lable: "Password"),
                    ElevatedButton(
                        onPressed: () {
                          value.registerUser().then((value) {
                            if (value != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Homepage()));
                            }
                          });
                        },
                        child: Text("Login"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
