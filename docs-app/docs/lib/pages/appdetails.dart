import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AppointmentDetailsPage extends StatefulWidget {
  String id;
  String patientName;
  String docName;
  String timeStart;
  String timeEnd;
  String desc;
  bool approved;
  AppointmentDetailsPage(this.id, this.patientName, this.docName,
      this.timeStart, this.timeEnd, this.desc, this.approved);
  @override
  _AppointmentDetailsPageState createState() => _AppointmentDetailsPageState(
      id, patientName, docName, timeStart, timeEnd, desc, approved);
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  String id;
  String patientName;
  String docName;
  String timeStart;
  String timeEnd;
  String desc;
  bool approved;
  _AppointmentDetailsPageState(this.id, this.patientName, this.docName,
      this.timeStart, this.timeEnd, this.desc, this.approved);
  bool video;
  Duration difference;
  DateTime now;
  void checkVideo() {
    now = DateTime.now();
    difference = DateTime.parse(timeEnd).difference(now);
    print(difference.inHours);
    if (difference.inHours < 1) {
      video = true;
    } else {
      video = false;
    }
    difference.inHours;
  }

  Map<FeatureFlagEnum, bool> featureFlags = {
    FeatureFlagEnum.INVITE_ENABLED: false,
    FeatureFlagEnum.MEETING_NAME_ENABLED: false,
    FeatureFlagEnum.RAISE_HAND_ENABLED: false,
    FeatureFlagEnum.LIVE_STREAMING_ENABLED: false,
    FeatureFlagEnum.MEETING_PASSWORD_ENABLED: false,
    FeatureFlagEnum.CALENDAR_ENABLED: false,
  };

  @override
  void initState() {
    checkVideo();
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
                          Row(
                            children: [
                              Text(
                                'Consulting Doctor:',
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
                                docName,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Concerned Patient:',
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
                                patientName,
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
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Time Slot Allotted:',
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
                                DateFormat('hh:mm').format(
                                      DateTime.parse(timeStart),
                                    ) +
                                    ' - ' +
                                    DateFormat('hh:mm').format(
                                      DateTime.parse(timeEnd),
                                    ),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                DateFormat('LLL d, y').format(
                                  DateTime.parse(timeStart),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Status:',
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
                                (approved)
                                    ? 'Approved:'
                                    : 'Waiting for Approval',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: (approved)
                                      ? lightPurple
                                      : Color.fromRGBO(98, 112, 221, 0.7),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(13),
                                color: (video)
                                    ? lightPurple
                                    : Color.fromRGBO(98, 112, 221, 0.7),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(13),
                                  splashColor: darkPurple,
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    final role = prefs.getString('role');
                                    if (approved) {
                                      if (video) {
                                        try {
                                          var options = JitsiMeetingOptions()
                                            ..room =
                                                id // Required, spaces will be trimmed
                                            ..userDisplayName =
                                                (role == 'patient')
                                                    ? patientName
                                                    : docName
                                            ..subject = 'Consultation'
                                            ..audioOnly = true
                                            ..audioMuted = true
                                            ..featureFlags = featureFlags
                                            ..videoMuted = true;

                                          await JitsiMeet.joinMeeting(options);
                                        } catch (error) {
                                          debugPrint("error: $error");
                                        }
                                      } else {
                                        Get.snackbar(
                                          'Error',
                                          "Wait for your slot",
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
                                            'Wait for your slot',
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
                                        "Your appointment is yet to be approved",
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
                                          'Your appointment is yet to be approved',
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
                                    height: Get.width * 0.12,
                                    width: Get.width * 0.85,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.video_call,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Video Consultation',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
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
