import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

void main() => getData();

Future<void> getData() async {
  var response = await http.get(
      Uri.parse('http://103.67.187.87/telu_laravel_08/public/api/products'),
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer 9|2jxjlJ43QUrYp17n2ou0tCDcVyeJwobm4USnarxz',
      });
  //print(response.body);

  var dataJson = jsonDecode(response.body);
  //first json array
  print(dataJson[0]['id']);
  print(dataJson[0]['name']);
  print(dataJson[0]['price']);

  //all json array
  for (var i = 0; i < dataJson.length; i++) {
    print(dataJson[i]['id']);
    print(dataJson[i]['name']);
    print(dataJson[i]['price']);
  }
}
