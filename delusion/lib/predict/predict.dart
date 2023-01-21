import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:delusion/database/consts.dart';

getPrediction(input) async {
  print(user_input);
  http.Response response;
  print('object-1');
  response = await http.post(
    Uri.parse("http://192.168.28.132:5000"),
    headers: {'content-type': 'application/json'},
    body: json.encode(
      {
        "input": user_input.toList(),
      },
    ),
  );
  //  response.headers.set('Content-type', 'application/json');
  print('object-3');
  var decodedResponse = json.decode(json.encode(response.body));
  print(decodedResponse);
  predicted_result = decodedResponse.toString();
  // notResponded = false;
}
