import 'package:docs/models/user.dart';
import 'package:docs/pages/signup_password.dart';
import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpAddressPage extends StatefulWidget {
  @override
  _SignUpAddressPageState createState() => _SignUpAddressPageState();
}

class _SignUpAddressPageState extends State<SignUpAddressPage> {
  TextEditingController pincodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController houseController = TextEditingController();
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
                                  textSelectionTheme: TextSelectionThemeData(
                                    selectionColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                    selectionHandleColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                  ),
                                ),
                                child: TextField(
                                  controller: pincodeController,
                                  maxLength: 6,
                                  cursorColor: lightPurple,
                                  cursorRadius: Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: InputDecoration(
                                      counterText: '',
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
                                  textSelectionTheme: TextSelectionThemeData(
                                    selectionColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                    selectionHandleColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                  ),
                                ),
                                child: TextField(
                                  controller: stateController,
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
                                  textSelectionTheme: TextSelectionThemeData(
                                    selectionColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                    selectionHandleColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                  ),
                                ),
                                child: TextField(
                                  controller: cityController,
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
                                  textSelectionTheme: TextSelectionThemeData(
                                    selectionColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                    selectionHandleColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                  ),
                                ),
                                child: TextField(
                                  controller: localityController,
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
                                  textSelectionTheme: TextSelectionThemeData(
                                    selectionColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                    selectionHandleColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                  ),
                                ),
                                child: TextField(
                                  controller: houseController,
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
                                if (pincodeController.text.length == 6 &&
                                    stateController.text.length > 0 &&
                                    cityController.text.length > 0 &&
                                    localityController.text.length > 0 &&
                                    houseController.text.length > 0) {
                                  userPincode = pincodeController.text;
                                  userState = stateController.text;
                                  userCity = cityController.text;
                                  userLocality = localityController.text;
                                  userHouse = houseController.text;
                                  Get.to(SignUpPasswordPage());
                                } else {
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
