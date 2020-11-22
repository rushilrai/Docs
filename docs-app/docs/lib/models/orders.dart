import 'dart:convert';

import 'package:docs/models/prescriptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Orders {
  String userid;
  String address;
  String contact;
  String prescriptionid;
  String docid;
  List<Meds> meds;
  String password;

  Orders(
    this.userid,
    this.address,
    this.contact,
    this.prescriptionid,
    this.docid,
    this.meds,
    this.password,
  );
}

List<Orders> ordersList = [];

Future<String> getOrders() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final id = prefs.getString('userid');
  final password = prefs.getString('password');
  http.Response ordersResponse = await http
      .get('https://bcic-docs-api.azurewebsites.net/pharmacy/all/$id');
  String ordersResponseJson = ordersResponse.body;
  ordersList.clear();
  for (var i = 0; i < jsonDecode(ordersResponseJson)['result'].length; i++) {
    ordersList.add(
      Orders(
          jsonDecode(ordersResponseJson)['result'][i]['user_id'],
          jsonDecode(ordersResponseJson)['result'][i]['address'],
          jsonDecode(ordersResponseJson)['result'][i]['contact'],
          jsonDecode(ordersResponseJson)['result'][i]['prescription']['_id'],
          jsonDecode(ordersResponseJson)['result'][i]['prescription']['doc_id'],
          convToMeds(jsonDecode(ordersResponseJson)['result'][i]['prescription']
              ['meds']),
          password),
    );
  }
  print(ordersList);
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
