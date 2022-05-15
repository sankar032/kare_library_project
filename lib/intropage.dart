import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karelibrary/app/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/auth/loginpage.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  Future<void> auth() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool("login") == null ||
        preferences.getBool("login") == false) {
      preferences.setBool("login", false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainApp(),
        ),
      );
    }
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => auth(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
