import 'dart:convert';
import 'package:docs/pages/sched.dart';
import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  List<String> specializations = [
    'Allergy & Immunology',
    'Anesthesiology',
    'Dermatology',
    'Diagnostic Radiology',
    'Emergency Medicine',
    'Family Medicine',
    'Internal Medicine',
    'Medical Genetics',
    'Neurology',
    'Nuclear Medicine',
    'Obstetrics & Gynecology',
    'Opthalmology',
    'Pathology',
    'Pediatrics',
    'Physical Medicine',
    'Preventive Medicine',
    'Psychiatry',
    'Radiation Oncology',
    'Surgery',
    'Urology',
  ];
  var spezSelected;
  bool spezSelection;
  List<String> idDoctors = [];
  List<String> nameDoctors = [];
  List<String> mobileDoctors = [];
  List<String> addressDoctors = [];
  List<String> spezDoctors = [];
  List<String> qualDoctors = [];
  List<String> slotInitDoctors = [];
  List<String> slotEndDoctors = [];
  void initState() {
    idDoctors = [];
    nameDoctors = [];
    mobileDoctors = [];
    addressDoctors = [];
    spezDoctors = [];
    qualDoctors = [];
    slotInitDoctors = [];
    slotEndDoctors = [];
    spezSelected = '';
    spezSelection = false;
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
                          FadeIn(
                            0.2,
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
                                      //print(nameDoctors.length);
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
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Hero(
                            tag: 'searchBox',
                            child: GestureDetector(
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
                                                  itemCount:
                                                      specializations.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      child: Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
                                                        color: (spezSelected ==
                                                                specializations[
                                                                    index])
                                                            ? lightPurple
                                                            : Colors.white,
                                                        child: InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                          splashColor:
                                                              darkPurple,
                                                          onTap: () {
                                                            setState(() async {
                                                              spezSelection =
                                                                  true;
                                                              spezSelected =
                                                                  specializations[
                                                                      index];
                                                              setState(() {});
                                                              Get.back();
                                                              http.Response
                                                                  findResponse =
                                                                  await http.get(
                                                                      'https://bcic-docs-api.azurewebsites.net/appointment/search/$spezSelected');
                                                              String
                                                                  findResponseJson =
                                                                  findResponse
                                                                      .body;
                                                              if (jsonDecode(findResponseJson)[
                                                                          "result"]
                                                                      .length >
                                                                  0) {
                                                                idDoctors = [];
                                                                nameDoctors =
                                                                    [];
                                                                mobileDoctors =
                                                                    [];
                                                                addressDoctors =
                                                                    [];
                                                                spezDoctors =
                                                                    [];
                                                                qualDoctors =
                                                                    [];
                                                                slotInitDoctors =
                                                                    [];
                                                                slotEndDoctors =
                                                                    [];
                                                                for (var i = 0;
                                                                    i <
                                                                        jsonDecode(findResponseJson)["result"]
                                                                            .length;
                                                                    i++) {
                                                                  nameDoctors.add(
                                                                      jsonDecode(findResponseJson)["result"]
                                                                              [
                                                                              i]
                                                                          [
                                                                          "name"]);
                                                                  idDoctors.add(
                                                                      jsonDecode(findResponseJson)["result"]
                                                                              [
                                                                              i]
                                                                          [
                                                                          "_id"]);
                                                                  mobileDoctors.add(
                                                                      jsonDecode(findResponseJson)["result"]
                                                                              [
                                                                              i]
                                                                          [
                                                                          "contact_no"]);
                                                                  addressDoctors.add(
                                                                      jsonDecode(findResponseJson)["result"]
                                                                              [
                                                                              i]
                                                                          [
                                                                          "address"]);
                                                                  spezDoctors.add(
                                                                      jsonDecode(findResponseJson)["result"]
                                                                              [
                                                                              i]
                                                                          [
                                                                          "specialization"]);
                                                                  qualDoctors.add(
                                                                      jsonDecode(findResponseJson)["result"]
                                                                              [
                                                                              i]
                                                                          [
                                                                          "qualification"]);
                                                                  slotInitDoctors.add(
                                                                      jsonDecode(findResponseJson)["result"]
                                                                              [
                                                                              i]
                                                                          [
                                                                          "slot_start"]);
                                                                  slotEndDoctors.add(
                                                                      jsonDecode(findResponseJson)["result"]
                                                                              [
                                                                              i]
                                                                          [
                                                                          "slot_end"]);
                                                                  setState(
                                                                      () {});
                                                                }
                                                              } else {
                                                                Get.snackbar(
                                                                  'Sorry',
                                                                  "No Doctors Found",
                                                                  barBlur: 0,
                                                                  snackPosition:
                                                                      SnackPosition
                                                                          .TOP,
                                                                  backgroundColor:
                                                                      bgColor,
                                                                  borderRadius:
                                                                      10,
                                                                  titleText:
                                                                      Text(
                                                                    'Sorry',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Trueno',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      color:
                                                                          lightPurple,
                                                                    ),
                                                                  ),
                                                                  messageText:
                                                                      Text(
                                                                    'No Doctors Found',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Trueno',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color:
                                                                          lightPurple,
                                                                    ),
                                                                  ),
                                                                );
                                                                setState(() {
                                                                  idDoctors =
                                                                      [];
                                                                  nameDoctors =
                                                                      [];
                                                                  mobileDoctors =
                                                                      [];
                                                                  addressDoctors =
                                                                      [];
                                                                  spezDoctors =
                                                                      [];
                                                                  qualDoctors =
                                                                      [];
                                                                  slotInitDoctors =
                                                                      [];
                                                                  slotEndDoctors =
                                                                      [];
                                                                });
                                                              }

                                                              print(
                                                                  findResponseJson);
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
                                                            height: Get.width *
                                                                0.14,
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    specializations[
                                                                        index],
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          24,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: (spezSelected ==
                                                                              specializations[index])
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
                                                    );
                                                  },
                                                ),
                                              )
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
                                      textSelectionTheme:
                                          TextSelectionThemeData(
                                        selectionColor:
                                            Color.fromRGBO(98, 112, 221, 0.34),
                                        selectionHandleColor:
                                            Color.fromRGBO(98, 112, 221, 0.34),
                                      ),
                                    ),
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: TextField(
                                        enabled: false,
                                        cursorColor: lightPurple,
                                        cursorRadius: Radius.circular(30),
                                        cursorWidth: 3,
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color.fromRGBO(
                                                98, 112, 221, 0.34),
                                          ),
                                          disabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          hintText: (spezSelection)
                                              ? spezSelected
                                              : 'Specialization',
                                          hintStyle: TextStyle(
                                            color: (spezSelection)
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
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          (idDoctors.length == 0)
                              ? Container()
                              : Expanded(
                                  child: Container(
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: idDoctors.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12.0),
                                          child: FadeIn(
                                            (0.5 + 0.3 * (index)),
                                            Container(
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
                                                          nameDoctors[index],
                                                          style: TextStyle(
                                                            color: lightPurple,
                                                            fontSize: 28,
                                                            fontFamily:
                                                                "Poppins",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Material(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          color: lightPurple,
                                                          child: InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            splashColor:
                                                                darkPurple,
                                                            onTap: () async {
                                                              var number =
                                                                  mobileDoctors[
                                                                      index];
                                                              if (await canLaunch(
                                                                  'tel:$number')) {
                                                                await launch(
                                                                    'tel:$number');
                                                              } else {
                                                                throw 'Could not send mail';
                                                              }
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                              ),
                                                              height:
                                                                  Get.width *
                                                                      0.07,
                                                              width: Get.width *
                                                                  0.07,
                                                              child: Center(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .call,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 14,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          qualDoctors[index],
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    98,
                                                                    112,
                                                                    221,
                                                                    0.34),
                                                            fontSize: 18,
                                                            fontFamily:
                                                                "Poppins",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Material(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          color: lightPurple,
                                                          child: InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            splashColor:
                                                                darkPurple,
                                                            onTap: () async {
                                                              var mail =
                                                                  idDoctors[
                                                                      index];

                                                              if (await canLaunch(
                                                                  'mailto:$mail')) {
                                                                await launch(
                                                                    "mailto:$mail?subject=Query regarding Appointment&body=Generated from Docs");
                                                              } else {
                                                                throw 'Could not send mail';
                                                              }
                                                              //print(nameDoctors.length);
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                              ),
                                                              height:
                                                                  Get.width *
                                                                      0.07,
                                                              width: Get.width *
                                                                  0.07,
                                                              child: Center(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .mail_rounded,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 14,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          (DateTime.parse(slotInitDoctors[
                                                                          index])
                                                                      .hour >
                                                                  10)
                                                              ? DateTime.parse(
                                                                          slotInitDoctors[
                                                                              index])
                                                                      .hour
                                                                      .toString() +
                                                                  ':00'
                                                              : '0' +
                                                                  DateTime.parse(
                                                                          slotInitDoctors[
                                                                              index])
                                                                      .hour
                                                                      .toString() +
                                                                  ':00',
                                                          style: TextStyle(
                                                            color: lightPurple,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                "Poppins",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          ' - ',
                                                          style: TextStyle(
                                                            color: lightPurple,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                "Poppins",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          (DateTime.parse(slotEndDoctors[
                                                                          index])
                                                                      .hour >
                                                                  10)
                                                              ? DateTime.parse(
                                                                          slotEndDoctors[
                                                                              index])
                                                                      .hour
                                                                      .toString() +
                                                                  ':00'
                                                              : '0' +
                                                                  DateTime.parse(
                                                                          slotEndDoctors[
                                                                              index])
                                                                      .hour
                                                                      .toString() +
                                                                  ':00',
                                                          style: TextStyle(
                                                            color: lightPurple,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                "Poppins",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Spacer(
                                                      flex: 1,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Material(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          color: lightPurple,
                                                          child: InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            splashColor:
                                                                darkPurple,
                                                            onTap: () async {
                                                              Get.to(
                                                                ScheduleAppointmentPage(
                                                                  nameDoctors[
                                                                      index],
                                                                  idDoctors[
                                                                      index],
                                                                  slotInitDoctors[
                                                                      index],
                                                                  slotEndDoctors[
                                                                      index],
                                                                ),
                                                              );
                                                              //print(nameDoctors.length);
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                              ),
                                                              height:
                                                                  Get.width *
                                                                      0.08,
                                                              width: Get.width *
                                                                  0.43,
                                                              child: Center(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_today_rounded,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 13,
                                                                    ),
                                                                    Text(
                                                                      'Schedule Appointment',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    )
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
                                              height: Get.width * 0.42,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
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
