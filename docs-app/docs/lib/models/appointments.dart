import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Appointments {
  String patientName;
  String docName;
  String id;
  String userId;
  String docId;
  String timeStart;
  String timeEnd;
  String desc;
  bool approved;

  Appointments(this.patientName, this.docName, this.id, this.userId, this.docId,
      this.timeStart, this.timeEnd, this.desc, this.approved);
}

List appointmentsList = [];
bool change;
// ignore: missing_return
Future<bool> getAppointments() async {
  change = false;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final role = prefs.getString('role');
  final id = prefs.getString('userid');
  http.Response appointmentsResponse = await http
      .get('https://bcic-docs-api.azurewebsites.net/appointment/all/$role/$id');
  String appointmentsResponseJson = appointmentsResponse.body;
  if (appointmentsResponse.statusCode == 200) {
    final tempAppointmentsList = [];
    for (var i = 0;
        i < jsonDecode(appointmentsResponseJson)['result'].length;
        i++) {
      tempAppointmentsList.add(Appointments(
          jsonDecode(appointmentsResponseJson)['result'][i]['name_user'],
          jsonDecode(appointmentsResponseJson)['result'][i]['name_doc'],
          jsonDecode(appointmentsResponseJson)['result'][i]['_id'],
          jsonDecode(appointmentsResponseJson)['result'][i]['user_id'],
          jsonDecode(appointmentsResponseJson)['result'][i]['doc_id'],
          jsonDecode(appointmentsResponseJson)['result'][i]['time_start'],
          jsonDecode(appointmentsResponseJson)['result'][i]['time_end'],
          jsonDecode(appointmentsResponseJson)['result'][i]['description'],
          jsonDecode(appointmentsResponseJson)['result'][i]['approved']));
    }
    if (appointmentsList == tempAppointmentsList) {
      print('updated');
    } else {
      appointmentsList = tempAppointmentsList;
      print('changing');
      change = true;
      //return true;
    }
  } else {
    print(appointmentsResponse.statusCode);
  }
  return change;
}
