import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

bool _loggedin;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    setState(() {
      getDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(_loggedin.toString()),
        ),
      ),
    );
  }
}

void getDetails() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _loggedin = prefs.getBool('loggedin');
}
