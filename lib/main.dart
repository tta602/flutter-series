import 'package:flutter/material.dart';

import 'dashboard/004/dashboard_screen_004.dart';
import 'login/001/login_screen_gradient_001.dart';
import 'login/002/mofinow_login_screen_002.dart';
import 'login/003/login_screen_003.dart';


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
      home: const DashboardScreen004(), //04
      // home: const LoginScreen003()
      // home: const MofinowLoginScreen(), //002
      // home: const LoginScreen(), //001
    );
  }
}


