import 'dart:developer';

import 'package:http/http.dart' as http;
import '../CatFact.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

class ApiService {
  Future<CatFact?> getUsers() async {
    try {
      var url = Uri.parse("https://catfact.ninja/facts");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        debugPrint(response.body.toString());
        CatFact _model = CatFact.fromJson(json.decode(response.body));
        debugPrint(_model.toString());
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
