import 'package:docs/pages/home.dart';
import 'package:docs/pages/login.dart';
import 'package:docs/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    leggo();
    super.initState();
  }

  void leggo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('loggedin')) {
      // ignore: await_only_futures
      final loggedin = await prefs.getBool('loggedin');
      // ignore: await_only_futures
      final name = await prefs.getString('name');
      // ignore: await_only_futures
      final role = await prefs.getString('role');
      if (loggedin) {
        await Future.delayed(
          Duration(seconds: 1),
        );
        Get.offAll(
          HomePage(name, role),
        );
      } else {
        await Future.delayed(
          Duration(seconds: 1),
        );
        Get.offAll(
          LoginPage(),
        );
      }
    } else {
      await Future.delayed(
        Duration(seconds: 1),
      );
      Get.offAll(
        LoginPage(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: lightPurple,
      ),
      child: Container(
        color: lightPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bgLogin.png',
              width: Get.width * 0.001,
            ),
            Image.asset(
              'assets/images/bghome.png',
              width: Get.width * 0.001,
            ),
            Material(
              type: MaterialType.transparency,
              child: Hero(
                tag: 'docs',
                child: Text(
                  'Docs.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
