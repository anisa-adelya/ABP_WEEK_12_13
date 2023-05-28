import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

void main() => postData();

Future<void> postData() async {
  var response = await http.post(
    Uri.parse('http://103.67.187.87/telu_laravel_08/public/api/login'),
    headers: <String, String>{
      'content-type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': 'kamis@gmail.com',
      'password': 'kamis',
    }),
  );

  print(response.body);

  var dataJson = jsonDecode(response.body);
  // //first json array
  print(dataJson['status']);
  print(dataJson['message']);
  print(dataJson['token']);
}
