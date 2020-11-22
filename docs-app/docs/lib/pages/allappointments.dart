import 'package:docs/models/appointments.dart';
import 'package:docs/pages/appdetails.dart';
import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllApointmentsPage extends StatefulWidget {
  @override
  _AllApointmentsPageState createState() => _AllApointmentsPageState();
}

class _AllApointmentsPageState extends State<AllApointmentsPage> {
  @override
  void initState() {
    getAppointments().then(
      (value) => setState2(),
    );
    super.initState();
  }

  void setState2() {
    print('ss');
    setState(() {});
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
                              FadeIn(
                                0.5,
                                Material(
                                  borderRadius: BorderRadius.circular(13),
                                  color: lightPurple,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(13),
                                    splashColor: darkPurple,
                                    onTap: () {
                                      Get.snackbar(
                                        'Refreshing',
                                        "Fetching all Appointments",
                                        barBlur: 0,
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: bgColor,
                                        borderRadius: 10,
                                        titleText: Text(
                                          'Refreshing',
                                          style: TextStyle(
                                            fontFamily: 'Trueno',
                                            fontWeight: FontWeight.w800,
                                            color: lightPurple,
                                          ),
                                        ),
                                        messageText: Text(
                                          'Fetching all Appointments',
                                          style: TextStyle(
                                            fontFamily: 'Trueno',
                                            fontWeight: FontWeight.w400,
                                            color: lightPurple,
                                          ),
                                        ),
                                      );
                                      getAppointments().then(
                                        (value) => setState2(),
                                      );
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
                                              Icons.refresh,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
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
                            height: 20,
                          ),
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: appointmentsList.length,
                                itemBuilder: (context, index) {
                                  return FadeIn(
                                    (0.5 + 0.3 * (index)),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
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
                                                          98, 112, 221, 0.8),
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
                                                          98, 112, 221, 0.8),
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
                                                        BorderRadius.circular(
                                                            5),
                                                    color: lightPurple,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      splashColor: darkPurple,
                                                      onTap: () async {
                                                        SharedPreferences
                                                            prefs =
                                                            await SharedPreferences
                                                                .getInstance();
                                                        final role = prefs
                                                            .getString('role');
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
                                                                  .circular(5),
                                                        ),
                                                        height:
                                                            Get.width * 0.08,
                                                        width: Get.width * 0.37,
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
                                                                  fontSize: 18,
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
