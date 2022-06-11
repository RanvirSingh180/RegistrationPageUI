import 'package:flutter/material.dart';
import 'register_page.dart';

Color tfColor = const Color(0xFFBBBBBB);
Color tfTextColor = const Color(0xFF687980);

final formKey = GlobalKey<FormState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
    );
  }
}
