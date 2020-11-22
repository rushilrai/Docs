import 'dart:convert';

import 'package:docs/models/user.dart';
import 'package:docs/pages/home.dart';
import 'package:docs/pages/login.dart';
import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPasswordPage extends StatefulWidget {
  @override
  _SignUpPasswordPageState createState() => _SignUpPasswordPageState();
}

class _SignUpPasswordPageState extends State<SignUpPasswordPage> {
  bool pswdConditions;
  bool pswdError;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  @override
  void initState() {
    pswdConditions = false;
    pswdError = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: bgColor,
      ),
      child: Scaffold(
        backgroundColor: lightPurple,
        body: SafeArea(
          child: Container(
            color: lightPurple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FadeIn(
                                0.5,
                                Material(
                                  borderRadius: BorderRadius.circular(13),
                                  color: lightPurple,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(13),
                                    splashColor: darkPurple,
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      height: Get.width * 0.12,
                                      width: Get.width * 0.12,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_back,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          FadeIn(
                            0.8,
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 10,
                                    spreadRadius: -10,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              height: Get.width * 0.14,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 2,
                                ),
                                child: Theme(
                                  data: ThemeData(
                                    textSelectionTheme: TextSelectionThemeData(
                                      selectionColor:
                                          Color.fromRGBO(98, 112, 221, 0.34),
                                      selectionHandleColor:
                                          Color.fromRGBO(98, 112, 221, 0.34),
                                    ),
                                  ),
                                  child: TextField(
                                    onChanged: (text) {
                                      if (6 > text.length) {
                                        setState(() {
                                          pswdError = true;
                                          pswdConditions = false;
                                        });
                                      }
                                      if (text.length >= 6) {
                                        setState(() {
                                          pswdError = false;
                                          pswdConditions = true;
                                        });
                                      }
                                    },
                                    controller: passwordController,
                                    maxLength: 12,
                                    obscureText: true,
                                    cursorColor: lightPurple,
                                    cursorRadius: Radius.circular(30),
                                    cursorWidth: 3,
                                    decoration: InputDecoration(
                                        counterText: '',
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                          color: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                          fontSize: 20,
                                        )),
                                    strutStyle: StrutStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: lightPurple,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          FadeIn(
                            1.1,
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 10,
                                    spreadRadius: -10,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              height: Get.width * 0.14,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 2,
                                ),
                                child: Theme(
                                  data: ThemeData(
                                    textSelectionTheme: TextSelectionThemeData(
                                      selectionColor:
                                          Color.fromRGBO(98, 112, 221, 0.34),
                                      selectionHandleColor:
                                          Color.fromRGBO(98, 112, 221, 0.34),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: passwordConfirmController,
                                    maxLength: 12,
                                    obscureText: true,
                                    cursorColor: lightPurple,
                                    cursorRadius: Radius.circular(30),
                                    cursorWidth: 3,
                                    decoration: InputDecoration(
                                        counterText: '',
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        hintText: 'Confirm Password',
                                        hintStyle: TextStyle(
                                          color: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                          fontSize: 20,
                                        )),
                                    strutStyle: StrutStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: lightPurple,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          FadeIn(
                            1.1,
                            Text(
                              'Password minimum length is 6',
                              style: TextStyle(
                                color: !(pswdError) ? bgColor : Colors.red[100],
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          FadeIn(
                            1.4,
                            Material(
                              borderRadius: BorderRadius.circular(13),
                              color: lightPurple,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(13),
                                splashColor: darkPurple,
                                onTap: () {
                                  if (passwordController.text ==
                                      passwordConfirmController.text) {
                                    if (passwordController.text.length > 6) {
                                      if (userRole == 'Patient') {
                                        _signupPatient(
                                            userEmail,
                                            passwordController.text,
                                            userName,
                                            userMobile,
                                            (userHouse +
                                                ', ' +
                                                userLocality +
                                                ', ' +
                                                userCity +
                                                ', ' +
                                                userState +
                                                ', ' +
                                                userPincode),
                                            context);
                                      } else {
                                        _signupDoctor(
                                            userEmail,
                                            passwordController.text,
                                            userName,
                                            userMobile,
                                            (userHouse +
                                                ', ' +
                                                userLocality +
                                                ', ' +
                                                userCity +
                                                ', ' +
                                                userState +
                                                ', ' +
                                                userPincode),
                                            userSpecialization,
                                            userQualification,
                                            ('1970-01-01 ' +
                                                userPeriodInit +
                                                ':00:00'),
                                            ('1970-01-01 ' +
                                                userPeriodFinal +
                                                ':00:00'),
                                            context);
                                      }
                                    } else {
                                      Get.snackbar(
                                        'Insecure',
                                        "Password should be greater than 6 characters",
                                        barBlur: 0,
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: bgColor,
                                        borderRadius: 10,
                                        titleText: Text(
                                          'Insecure',
                                          style: TextStyle(
                                            fontFamily: 'Trueno',
                                            fontWeight: FontWeight.w800,
                                            color: lightPurple,
                                          ),
                                        ),
                                        messageText: Text(
                                          'Password should be greater than 6 characters',
                                          style: TextStyle(
                                            fontFamily: 'Trueno',
                                            fontWeight: FontWeight.w400,
                                            color: lightPurple,
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    Get.snackbar(
                                      'Error',
                                      "Passwords do not match",
                                      barBlur: 0,
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: bgColor,
                                      borderRadius: 10,
                                      titleText: Text(
                                        'Error',
                                        style: TextStyle(
                                          fontFamily: 'Trueno',
                                          fontWeight: FontWeight.w800,
                                          color: lightPurple,
                                        ),
                                      ),
                                      messageText: Text(
                                        'Passwords do not match',
                                        style: TextStyle(
                                          fontFamily: 'Trueno',
                                          fontWeight: FontWeight.w400,
                                          color: lightPurple,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  height: Get.width * 0.14,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Proceed',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, -5),
                          blurRadius: 10,
                          spreadRadius: -9,
                        )
                      ],
                      color: bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      ),
                    ),
                    width: Get.width,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showLoadingDialogue(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please Wait'),
          content: Text('Loading...'),
        );
      });
}

void _signupPatient(String id, String password, String name, String contact,
    String address, BuildContext context) async {
  showLoadingDialogue(context);
  final http.Response signupResponse = await http.post(
    'https://bcic-docs-api.azurewebsites.net/user/signup/patient',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        "_id": id,
        "password": password,
        "name": name,
        "contact_no": contact,
        "address": address
      },
    ),
  );
  if (signupResponse.statusCode == 200) {
    String signupResponseJSON = signupResponse.body;
    print(signupResponseJSON);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', userRole);
    await prefs.setString('userid', userEmail);
    await prefs.setString('password', password);
    await prefs.setString('name', name);
    await prefs.setString('mobile', userMobile);
    await prefs.setString('address', address);
    await prefs.setBool('loggedin', true);
    print(userRole);
    Get.offAll(LoginPage());
    Get.snackbar(
      'Successful',
      "Login to continue",
      barBlur: 0,
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      borderRadius: 10,
      titleText: Text(
        'Successful',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w800,
          color: lightPurple,
        ),
      ),
      messageText: Text(
        'Login to continue',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w400,
          color: lightPurple,
        ),
      ),
    );
  } else {
    Get.back();
    Get.snackbar(
      'Failed',
      "We are having trouble signing up",
      barBlur: 0,
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      borderRadius: 10,
      titleText: Text(
        'Failed',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w800,
          color: lightPurple,
        ),
      ),
      messageText: Text(
        jsonDecode(signupResponse.body)['msg'],
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w400,
          color: lightPurple,
        ),
      ),
    );
  }
}

void _signupDoctor(
    String id,
    String password,
    String name,
    String contact,
    String address,
    String specialization,
    String qualification,
    String slotStart,
    String slotEnd,
    BuildContext context) async {
  showLoadingDialogue(context);
  final http.Response signupResponse = await http.post(
    'https://bcic-docs-api.azurewebsites.net/user/signup/doctor',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        "_id": id,
        "password": password,
        "name": name,
        "contact_no": contact,
        "address": address,
        "specialization": specialization,
        "qualification": qualification,
        "slot_start": slotStart,
        "slot_end": slotEnd
      },
    ),
  );
  if (signupResponse.statusCode == 200) {
    String signupResponseJSON = signupResponse.body;
    print(signupResponseJSON);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', userRole);
    await prefs.setString('userid', userEmail);
    await prefs.setString('password', password);
    await prefs.setString('name', name);
    await prefs.setString('mobile', userMobile);
    await prefs.setString('address', address);
    await prefs.setString('spez', userSpecialization);
    await prefs.setString('qual', userQualification);
    await prefs.setString('slotStart', slotStart);
    await prefs.setString('slotEnd', slotEnd);
    await prefs.setBool('loggedin', true);
    Get.offAll(HomePage(name, userRole));
  } else {
    Get.back();
    Get.snackbar(
      'Failed',
      "We are having trouble signing up",
      barBlur: 0,
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      borderRadius: 10,
      titleText: Text(
        'Failed',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w800,
          color: lightPurple,
        ),
      ),
      messageText: Text(
        'We are having trouble signing up',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w400,
          color: lightPurple,
        ),
      ),
    );
  }
}
