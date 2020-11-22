import 'dart:convert';

import 'package:docs/pages/home.dart';
import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ScheduleAppointmentPage extends StatefulWidget {
  String docName;
  String docId;
  String slotStart;
  String slotEnd;
  ScheduleAppointmentPage(
      this.docName, this.docId, this.slotStart, this.slotEnd);
  @override
  _ScheduleAppointmentPageState createState() =>
      _ScheduleAppointmentPageState(docName, docId, slotStart, slotEnd);
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  String docName;
  String docId;
  String slotStart;
  String slotEnd;

  _ScheduleAppointmentPageState(
      this.docName, this.docId, this.slotStart, this.slotEnd);

  var slotInitSelected;
  DateTime dateSelected;
  TextEditingController descController = TextEditingController();
  @override
  void initState() {
    print(slotStart);
    print(slotEnd);
    slotInitSelected = '-';
    dateSelected = DateTime.now();
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
                      child: ListView(
                        physics: BouncingScrollPhysics(),
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                ' Concerned Doctor:',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(76, 76, 81, 0.8),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                ' ' + docName,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                ' Choose Appointment Time:',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(76, 76, 81, 0.8),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              final ranges = [];
                              final timeStart = DateTime.parse(slotStart);
                              final timeFinish = DateTime.parse(slotEnd);
                              var range = timeFinish.difference(timeStart);
                              print(range);
                              for (var i = 0; i < range.inHours; i++) {
                                if (timeStart.hour + i < 24) {
                                  ranges.add(timeStart.hour + i);
                                } else {
                                  ranges.add((timeStart.hour + i) - 24);
                                }
                              }
                              // print(ranges);
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
                                      height: Get.width * 1.5,
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
                                                        BorderRadius.circular(
                                                            13),
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
                                            Container(
                                              height: Get.width * 0.95,
                                              child: ListView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: ranges.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Material(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      color: Colors.white,
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
                                                        splashColor: darkPurple,
                                                        onTap: () {
                                                          setState(() {
                                                            slotInitSelected = (ranges[
                                                                        index] <
                                                                    10)
                                                                ? '0' +
                                                                    ranges[index]
                                                                        .toString()
                                                                : ranges[index]
                                                                    .toString();
                                                            Get.back();
                                                          });
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13),
                                                          ),
                                                          height:
                                                              Get.width * 0.14,
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  ranges[index]
                                                                          .toString() +
                                                                      ':00 - ' +
                                                                      (ranges[index] +
                                                                              1)
                                                                          .toString() +
                                                                      ':00',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        24,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color:
                                                                        lightPurple,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  (slotInitSelected == '-')
                                      ? ' ' + slotInitSelected
                                      : ' ' +
                                          slotInitSelected +
                                          ':00 - ' +
                                          (int.parse(slotInitSelected) + 1)
                                              .toString() +
                                          ':00',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: lightPurple,
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: lightPurple,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    splashColor: darkPurple,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: Get.width * 0.09,
                                      width: Get.width * 0.09,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.alarm_add_rounded,
                                              color: Colors.white,
                                              size: 18,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                ' Choose Appointment Date:',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(76, 76, 81, 0.8),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () async {
                              final now = DateTime.now();
                              final selectionDate = await showDatePicker(
                                helpText: 'Select Date for Appointment',
                                context: context,
                                firstDate: now,
                                initialDate: now,
                                lastDate: now.add(
                                  Duration(days: 14),
                                ),
                              );
                              setState(() {
                                if (selectionDate != null) {
                                  dateSelected = selectionDate;
                                } else {
                                  print('none chosen');
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ' ' +
                                      dateSelected.day.toString() +
                                      '/' +
                                      dateSelected.month.toString() +
                                      '/' +
                                      dateSelected.year.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: lightPurple,
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: lightPurple,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    splashColor: darkPurple,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: Get.width * 0.09,
                                      width: Get.width * 0.09,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.calendar_today_rounded,
                                              color: Colors.white,
                                              size: 18,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 8.0,
                              ),
                              child: TextField(
                                maxLines: 8,
                                maxLength: 128,
                                controller: descController,
                                cursorColor: lightPurple,
                                cursorRadius: Radius.circular(30),
                                cursorWidth: 3,
                                decoration: InputDecoration(
                                  counterStyle: TextStyle(
                                    color: Color.fromRGBO(98, 112, 221, 0.34),
                                    fontSize: 12,
                                  ),
                                  disabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Reason for Appointment',
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
                            height: Get.width * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(13),
                            color: lightPurple,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(13),
                              splashColor: darkPurple,
                              onTap: () async {
                                if (slotInitSelected != '-' &&
                                    descController.text.length > 0) {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  final userId = prefs.getString('userid');
                                  final patientName = prefs.getString('name');
                                  final password = prefs.getString('password');
                                  showLoadingDialogue(context);
                                  _newAppointment(
                                      patientName,
                                      docName,
                                      userId,
                                      password,
                                      docId,
                                      descController.text,
                                      false,
                                      dateSelected.year.toString() +
                                          '-' +
                                          dateSelected.month.toString() +
                                          '-' +
                                          dateSelected.day.toString() +
                                          ' ' +
                                          slotInitSelected +
                                          ':00:00',
                                      dateSelected.year.toString() +
                                          '-' +
                                          dateSelected.month.toString() +
                                          '-' +
                                          dateSelected.day.toString() +
                                          ' ' +
                                          (((int.parse(slotInitSelected) + 1)
                                                      .toString()
                                                      .length ==
                                                  1)
                                              ? '0' +
                                                  (int.parse(slotInitSelected) +
                                                          1)
                                                      .toString() +
                                                  ':00:00'
                                              : (int.parse(slotInitSelected) +
                                                          1)
                                                      .toString() +
                                                  ':00:00'),
                                      context);
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    "Fill All Details",
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
                                      'Fill All Details',
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
                                        'Send Request',
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

void _newAppointment(
    String patientName,
    String docName,
    String id,
    String password,
    String docId,
    String description,
    bool approved,
    String timeStart,
    String timeEnd,
    BuildContext context) async {
  //showLoadingDialogue(context);
  final http.Response newAppointmentResponse = await http.post(
    'https://bcic-docs-api.azurewebsites.net/appointment/new',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {
        "appt": {
          "name_user": patientName,
          "name_doc": docName,
          "user_id": id,
          "doc_id": docId,
          "time_start": timeStart,
          "time_end": timeEnd,
          "description": description,
          "approved": approved
        },
        "userlogin": {"_id": id, "password": password}
      },
    ),
  );
  print(id +
      docId +
      timeStart +
      timeEnd +
      description +
      approved.toString() +
      password);
  print(newAppointmentResponse.body);
  if (newAppointmentResponse.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final role = prefs.getString('role');
    String newAppointmentResponseJson = newAppointmentResponse.body;
    print(newAppointmentResponseJson);
    Get.offAll(HomePage(name, role));
  } else {
    Get.back();
    Get.snackbar(
      'Failed',
      "We are having trouble setting up Appointment",
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
        'Choose another Slot',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w400,
          color: lightPurple,
        ),
      ),
    );
  }
}
