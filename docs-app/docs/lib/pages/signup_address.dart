import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpAddressPage extends StatefulWidget {
  @override
  _SignUpAddressPageState createState() => _SignUpAddressPageState();
}

class _SignUpAddressPageState extends State<SignUpAddressPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: lightPurple,
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
                              Material(
                                borderRadius: BorderRadius.circular(13),
                                color: lightPurple,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(13),
                                  splashColor: darkPurple,
                                  onTap: () {
                                    print('hello');
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
                            ],
                          ),
                          SizedBox(
                            height: 24,
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
                                  cursorColor: lightPurple,
                                  cursorRadius: Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: 'Pincode',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(98, 112, 221, 0.34),
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
                                  cursorColor: lightPurple,
                                  cursorRadius: Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: 'State',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(98, 112, 221, 0.34),
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
                                  cursorColor: lightPurple,
                                  cursorRadius: Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: 'City',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(98, 112, 221, 0.34),
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
                                  cursorColor: lightPurple,
                                  cursorRadius: Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: 'Locality',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(98, 112, 221, 0.34),
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
                                  cursorColor: lightPurple,
                                  cursorRadius: Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: 'House No.',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(98, 112, 221, 0.34),
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
                                print('hello');
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
