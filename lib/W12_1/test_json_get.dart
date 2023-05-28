import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

void main() => getData();

Future<void> getData() async {
  var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //print(response.body);

  var dataJson = jsonDecode(response.body);
  //first json array
  print(dataJson[0]['userId']);
  print(dataJson[0]['id']);
  print(dataJson[0]['title']);
  print(dataJson[0]['body']);

  //all json array
  for (var i = 0; i < dataJson.length; i++) {
    print(dataJson[i]['userId']);
    print(dataJson[i]['id']);
    print(dataJson[i]['title']);
    print(dataJson[i]['body']);
  }
}
