import 'package:flutter/material.dart';
import 'package:shersoft/register.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailCOntroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              height: 480,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an company'),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                      }, child: Text("create")),
                    ],
                  ),
                  _loginform(controller: _emailCOntroller, lable: 'Email'),
                  _loginform(
                      controller: _passwordController, lable: 'Password'),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text("Remeber me"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xFF0A1EBE),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: Text("Login")),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _loginform(
      {required String lable, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lable),
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ))),
          ),
        ],
      ),
    );
  }
}
