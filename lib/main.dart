import 'package:flutter/material.dart';
import 'package:shersoft/view/home/homepage.dart';
import 'package:shersoft/view/login&register/login.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.light(),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,

    );
  }
}