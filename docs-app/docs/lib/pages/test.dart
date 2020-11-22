import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {
              _joinMeeting();
            },
            child: Container(
              child: Center(
                child: Text('Join'),
              ),
              height: 100,
              width: 200,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}

_joinMeeting() async {
  try {
    var options = JitsiMeetingOptions()
      ..room = "Appointment" // Required, spaces will be trimmed
      ..userDisplayName = "Rushil"
      ..audioOnly = true
      ..audioMuted = true
      ..videoMuted = true;

    await JitsiMeet.joinMeeting(options);
  } catch (error) {
    debugPrint("error: $error");
  }
}
