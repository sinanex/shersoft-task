import 'package:flutter/material.dart';
import 'package:shersoft/view/login&register/widget/widget.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailCOntroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _adreesController = TextEditingController();
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
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Text("Register",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),),
                  loginform(controller:_nameController,lable: "Company name" ),
                  loginform(controller:_emailCOntroller,lable: "Email" ),
                  loginform(controller:_adreesController,lable: "Address" ),
                  loginform(controller:_phoneController,lable: "phone number" ),
                  loginform(controller:_passwordController,lable: "Password" ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
