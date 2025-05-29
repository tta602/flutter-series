import 'package:flutter/material.dart';

import 'login/001/login_screen_gradient_001.dart';
import 'login/002/mofinow_login_screen_002.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LoginScreen(), //001
      home: const MofinowLoginScreen(),
    );
  }
}


