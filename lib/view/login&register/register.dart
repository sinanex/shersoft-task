
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shersoft/controller/login.dart';
import 'package:shersoft/view/home/homepage.dart';
import 'package:shersoft/view/login&register/widget/widget.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController adreesController = TextEditingController();
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[700]!, Colors.blue[400]!]),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Consumer<UserController>(
                  builder: (context, provider, child) => Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      loginform(
                          controller: nameController, lable: "Company name"),
                      loginform(controller: emailController, lable: "Email"),
                      loginform(lable: "Address", controller: adreesController),
                      loginform(
                          lable: "phone number", controller: phoneController),
                      loginform(
                          lable: "password", controller: passwordController),
                      ElevatedButton(
                          onPressed: () {
                            provider
                                .registerUser(context: context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    address: adreesController.text,
                                    phone: phoneController.text)
                                .then((value) {
                              if (value != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Homepage()));
                                provider.addAccounts(
                                    email: emailController.text,
                                    password: passwordController.text);
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
      ),
    );
  }
}
