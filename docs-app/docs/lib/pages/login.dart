import 'dart:convert';

import 'package:docs/pages/home.dart';
import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool pswdConditions;
  bool pswdError;
  bool doctorSelected;
  bool patientSelected;
  String role;

  @override
  void initState() {
    pswdConditions = false;
    pswdError = true;
    doctorSelected = false;
    patientSelected = false;
    role = '';
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
          top: false,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/bgLogin.png'),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Docs.',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 54,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' Saving lives remotely.',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Column(
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              BottomSheet(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                onClosing: () {},
                                builder: (context) {
                                  return Container(
                                    height: Get.width * 0.7,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                        top: 20,
                                        bottom: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Material(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            color: lightPurple,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              splashColor: darkPurple,
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                height: Get.width * 0.12,
                                                width: Get.width * 0.12,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Material(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            color: (doctorSelected)
                                                ? lightPurple
                                                : Colors.white,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              splashColor: darkPurple,
                                              onTap: () {
                                                setState(() {
                                                  doctorSelected = true;
                                                  patientSelected = false;
                                                  role = 'doctor';
                                                  Get.back();
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                height: Get.width * 0.14,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Doctor',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              (doctorSelected)
                                                                  ? Colors.white
                                                                  : lightPurple,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Material(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            color: (patientSelected)
                                                ? lightPurple
                                                : Colors.white,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              splashColor: darkPurple,
                                              onTap: () {
                                                setState(() {
                                                  doctorSelected = false;
                                                  patientSelected = true;
                                                  role = 'patient';
                                                  Get.back();
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                height: Get.width * 0.14,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Patient',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              (patientSelected)
                                                                  ? Colors.white
                                                                  : lightPurple,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(),
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
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
                                  textSelectionHandleColor:
                                      Color.fromRGBO(98, 112, 221, 0.34),
                                  textSelectionColor:
                                      Color.fromRGBO(98, 112, 221, 0.34),
                                ),
                                child: TextField(
                                  enabled: false,
                                  cursorColor: lightPurple,
                                  cursorRadius: Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Color.fromRGBO(98, 112, 221, 0.34),
                                    ),
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: (doctorSelected)
                                        ? 'Doctor'
                                        : (patientSelected)
                                            ? 'Patient'
                                            : 'User Type',
                                    hintStyle: TextStyle(
                                      color: (doctorSelected)
                                          ? lightPurple
                                          : (patientSelected)
                                              ? lightPurple
                                              : Color.fromRGBO(
                                                  98, 112, 221, 0.34),
                                      fontSize: 20,
                                    ),
                                  ),
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
                                textSelectionHandleColor:
                                    Color.fromRGBO(98, 112, 221, 0.34),
                                textSelectionColor:
                                    Color.fromRGBO(98, 112, 221, 0.34),
                              ),
                              child: TextField(
                                controller: emailController,
                                cursorColor: lightPurple,
                                cursorRadius: Radius.circular(30),
                                cursorWidth: 3,
                                decoration: InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: 'Enter E-Mail',
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(98, 112, 221, 0.34),
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
                        SizedBox(
                          height: 12,
                        ),
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
                                textSelectionHandleColor:
                                    Color.fromRGBO(98, 112, 221, 0.34),
                                textSelectionColor:
                                    Color.fromRGBO(98, 112, 221, 0.34),
                              ),
                              child: TextField(
                                controller: passwordController,
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
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                cursorColor: lightPurple,
                                cursorRadius: Radius.circular(30),
                                cursorWidth: 3,
                                decoration: InputDecoration(
                                  disabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(98, 112, 221, 0.34),
                                    fontSize: 20,
                                  ),
                                ),
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
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Password minimum length is 6',
                          style: TextStyle(
                            color: !(pswdError) ? bgColor : Colors.red[100],
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(13),
                          color: lightPurple,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(13),
                            splashColor: darkPurple,
                            onTap: () {
                              _login(
                                role,
                                emailController.text,
                                passwordController.text,
                                context,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              height: Get.width * 0.14,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login',
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
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New User ? ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(98, 112, 221, 0.34),
                              ),
                            ),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: lightPurple,
                              ),
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, -5),
                          blurRadius: 30,
                          spreadRadius: -9,
                        )
                      ],
                      color: bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      )),
                  height: Get.width * 0.9,
                  width: Get.width,
                ),
              ],
            ),
            color: lightPurple,
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

void _login(
    String role, String email, String password, BuildContext context) async {
  showLoadingDialogue(context);
  final http.Response loginResponse = await http.post(
    'https://bcic-docs-api.azurewebsites.net/user/login/$role',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{"_id": email, "password": password},
    ),
  );
  if (loginResponse.statusCode == 200) {
    String loginResponseJson = loginResponse.body;
    var id;
    var name;
    var mobile;
    var address;
    id = jsonDecode(loginResponseJson)['user']['_id'];
    name = jsonDecode(loginResponseJson)['user']['name'];
    mobile = jsonDecode(loginResponseJson)['user']['contact_no'];
    address = jsonDecode(loginResponseJson)['user']['address'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('role', role);
    prefs.setString('userid', id);
    prefs.setString('password', password);
    prefs.setString('name', name);
    prefs.setString('mobile', mobile);
    prefs.setString('address', address);
    prefs.setBool('loggedin', true);
    print(prefs.getBool('loggedin'));
    Get.offAll(HomePage());
  } else {
    Get.back();
    Get.snackbar(
      'Failed',
      "Incorrect Details",
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
        'Incorrect Details',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w400,
          color: lightPurple,
        ),
      ),
    );
  }
}
