import 'dart:convert';

import 'package:docs/models/prescriptions.dart';
import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AllPrescriptionPage extends StatefulWidget {
  String role;
  AllPrescriptionPage(this.role);
  @override
  _AllPrescriptionPageState createState() => _AllPrescriptionPageState(role);
}

class _AllPrescriptionPageState extends State<AllPrescriptionPage> {
  String role;
  _AllPrescriptionPageState(this.role);
  @override
  void initState() {
    updatePrescription();
    print(role);
    super.initState();
  }

  void updatePrescription() async {
    final refresh = await getPrescriptions();
    if (refresh == 'refresh') {
      setState(() {});
    }
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
                                itemCount: prescriptionsList.length,
                                itemBuilder: (context, index) {
                                  return FadeIn(
                                    (0.5 + 0.3 * (index)),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 12.0,
                                      ),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 12.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount:
                                                    prescriptionsList[index]
                                                        .meds
                                                        .length,
                                                itemBuilder: (context, i) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          ' • ' +
                                                              prescriptionsList[
                                                                      index]
                                                                  .meds[i]
                                                                  .name
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: lightPurple,
                                                          ),
                                                        ),
                                                        Text(
                                                          '     ' +
                                                              prescriptionsList[
                                                                      index]
                                                                  .meds[i]
                                                                  .comment
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Color.fromRGBO(
                                                                    98,
                                                                    112,
                                                                    221,
                                                                    0.7),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                              (role == 'doctor')
                                                  ? SizedBox(height: 0)
                                                  : SizedBox(
                                                      height: 10,
                                                    ),
                                              (role == 'doctor')
                                                  ? Container()
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16.0),
                                                      child: Material(
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
                                                            final userid =
                                                                // ignore: await_only_futures
                                                                await prefs
                                                                    .getString(
                                                                        'userid');
                                                            final password =
                                                                // ignore: await_only_futures
                                                                await prefs
                                                                    .getString(
                                                                        'password');
                                                            final address =
                                                                // ignore: await_only_futures
                                                                await prefs
                                                                    .getString(
                                                                        'address');
                                                            final contact =
                                                                // ignore: await_only_futures
                                                                await prefs
                                                                    .getString(
                                                                        'mobile');
                                                            newOrder(
                                                                context,
                                                                userid,
                                                                prescriptionsList[
                                                                        index]
                                                                    .docId,
                                                                prescriptionsList[
                                                                        index]
                                                                    .meds,
                                                                password,
                                                                prescriptionsList[
                                                                        index]
                                                                    .prescriptionId,
                                                                address,
                                                                contact);
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
                                                                  Text(
                                                                    'Place Order',
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
                                                    ),
                                            ],
                                          ),
                                        ),

                                        //height: Get.width * 0.4,
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

void newOrder(context, userid, docid, List<Meds> meds, password, prescriptionid,
    address, contact) async {
  showLoadingDialogue(context);
  http.Response orderNewResponse = await http.post(
    'https://bcic-docs-api.azurewebsites.net/pharmacy/request',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {
        "order": {
          "user_id": userid,
          "address": address,
          "contact": contact,
          "prescription": {
            "_id": prescriptionid,
            "user_id": userid,
            "doc_id": docid,
            "meds": meds
          }
        },
        "userlogin": {"_id": userid, "password": password}
      },
    ),
  );
  print(orderNewResponse.body);
  await getPrescriptions();
  if (orderNewResponse.statusCode == 200) {
    Get.back();
    Get.back();
    Get.snackbar(
      'Order Placed',
      "Check Mail for Details",
      barBlur: 0,
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      borderRadius: 10,
      titleText: Text(
        'Order Placed',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w800,
          color: lightPurple,
        ),
      ),
      messageText: Text(
        'Check Mail for Details',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w400,
          color: lightPurple,
        ),
      ),
    );
  } else {
    Get.back();
    /*Get.snackbar(
      'Order Failed',
      "Try Again Later",
      barBlur: 0,
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      borderRadius: 10,
      titleText: Text(
        'Order Failed',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w800,
          color: lightPurple,
        ),
      ),
      messageText: Text(
        'Try Again Later',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w400,
          color: lightPurple,
        ),
      ),
    );*/
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
    },
  );
}
