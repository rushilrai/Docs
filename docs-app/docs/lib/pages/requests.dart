import 'dart:convert';

import 'package:docs/models/appointments.dart';
import 'package:docs/pages/appdetails.dart';
import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  @override
  void initState() {
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
                        //physics: BouncingScrollPhysics(),
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
                            height: 20,
                          ),
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: appointmentsList.length,
                                itemBuilder: (context, index) {
                                  return (appointmentsList[index].approved)
                                      ? Container()
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12.0),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        DateFormat('LLL d, y')
                                                            .format(DateTime.parse(
                                                                appointmentsList[
                                                                        index]
                                                                    .timeStart)),
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromRGBO(
                                                              98,
                                                              112,
                                                              221,
                                                              0.8),
                                                        ),
                                                      ),
                                                      Text(
                                                        DateFormat('H:mm').format(
                                                            DateTime.parse(
                                                                appointmentsList[
                                                                        index]
                                                                    .timeStart)),
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromRGBO(
                                                              98,
                                                              112,
                                                              221,
                                                              0.8),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        appointmentsList[index]
                                                            .patientName,
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 32,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: darkPurple,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: lightPurple,
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          splashColor:
                                                              darkPurple,
                                                          onTap: () async {
                                                            SharedPreferences
                                                                prefs =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            final role =
                                                                prefs.getString(
                                                                    'role');
                                                            Get.to(
                                                              AppointmentDetailsPage(
                                                                appointmentsList[
                                                                        index]
                                                                    .userId,
                                                                role,
                                                                appointmentsList[
                                                                        index]
                                                                    .id,
                                                                appointmentsList[
                                                                        index]
                                                                    .patientName,
                                                                appointmentsList[
                                                                        index]
                                                                    .docName,
                                                                appointmentsList[
                                                                        index]
                                                                    .timeStart,
                                                                appointmentsList[
                                                                        index]
                                                                    .timeEnd,
                                                                appointmentsList[
                                                                        index]
                                                                    .desc,
                                                                appointmentsList[
                                                                        index]
                                                                    .approved,
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            height: Get.width *
                                                                0.08,
                                                            width: Get.width *
                                                                0.37,
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons.info,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 18,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    'Details',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: lightPurple,
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          splashColor:
                                                              darkPurple,
                                                          onTap: () async {
                                                            change = await acceptAppointment(
                                                                context,
                                                                appointmentsList[
                                                                        index]
                                                                    .id);
                                                            if (change) {
                                                              setState(() {});
                                                            } else {
                                                              print(
                                                                  'no change');
                                                            }
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            height: Get.width *
                                                                0.08,
                                                            width: Get.width *
                                                                0.37,
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 18,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    'Accept',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            height: Get.width * 0.4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                          ),
                                        );
                                },
                              ),
                            ),
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

Future<bool> acceptAppointment(BuildContext context, String appId) async {
  print('accepting');
  bool change = false;
  showLoadingDialogue(context);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final id = prefs.getString('userid');
  final password = prefs.getString('password');
  http.Response acceptAppointmentResponse = await http.post(
    'https://bcic-docs-api.azurewebsites.net/appointment/approve/$appId',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {
        "userlogin": {"_id": id, "password": password}
      },
    ),
  );
  print(acceptAppointmentResponse.body);
  if (acceptAppointmentResponse.statusCode == 200) {
    await getAppointments();
    Get.back();
    change = true;
  } else {
    change = false;
    Get.snackbar(
      'Failed',
      "Server Error",
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
        'Server Error',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w400,
          color: lightPurple,
        ),
      ),
    );
  }
  return change;
}
