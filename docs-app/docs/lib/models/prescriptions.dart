import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Prescriptions {
  String prescriptionId;
  String userId;
  String docId;
  List<Meds> meds;

  Prescriptions(this.prescriptionId, this.userId, this.docId, this.meds);
}

class Meds {
  String id;
  String name;
  String quantity;
  String comment;

  Meds(this.id, this.name, this.quantity, this.comment);

  Meds.prescr(this.name, this.quantity, this.comment);

  Map toJson() => {
        '_id': id,
        'name': name,
        'quantity': quantity,
        'comment': comment,
      };

  factory Meds.fromJson(Map<String, dynamic> json) {
    return Meds(
      json['_id'],
      json['name'],
      json['quantity'],
      json['comment'],
    );
  }
}

List<Prescriptions> prescriptionsList = [];

Future<String> getPrescriptions() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final id = prefs.getString('userid');
  final role = prefs.getString('role');
  http.Response prescriptionResponse = await http.get(
      'https://bcic-docs-api.azurewebsites.net/prescription/all/$role/$id');
  String prescriptionResponseJson = prescriptionResponse.body;
  prescriptionsList.clear();
  for (var i = 0;
      i < jsonDecode(prescriptionResponseJson)['result'].length;
      i++) {
    prescriptionsList.add(
      Prescriptions(
        jsonDecode(prescriptionResponseJson)['result'][i]['_id'],
        jsonDecode(prescriptionResponseJson)['result'][i]['user_id'],
        jsonDecode(prescriptionResponseJson)['result'][i]['doc_id'],
        convToMeds(jsonDecode(prescriptionResponseJson)['result'][i]['meds']),
      ),
    );
  }
  return 'refresh';
}

List<Meds> convToMeds(List<dynamic> medsDynamic) {
  List<Meds> medsConverted = [];
  for (var i = 0; i < medsDynamic.length; i++) {
    medsConverted.add(
      Meds.fromJson(medsDynamic[i]),
    );
  }
  return medsConverted;
}
