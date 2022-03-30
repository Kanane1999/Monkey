import 'dart:html';

import 'package:flutter/material.dart';
import 'package:monkey/screens/auth/login.dart';
import 'package:monkey/screens/auth/signup.dart';
import 'package:monkey/screens/start/start_page.dart';

import 'screens/start/SplashScreen.dart';

class Monkey extends StatelessWidget {
  const Monkey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF008AF0),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Monkey',
      home: const SplashScreen(),
      routes: {
        StartPage.routeName: (context) => const StartPage(),
        Login.routeName: (context) => const Login(),
        Signup.routeName: (context) => const Signup(),
      },
    );
  }
}
