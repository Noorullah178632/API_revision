import 'dart:convert';

import 'package:api_revision/api_practice/json_dart_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiHome extends StatefulWidget {
  const ApiHome({super.key});

  @override
  State<ApiHome> createState() => _ApiHomeState();
}

class _ApiHomeState extends State<ApiHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("APi call "), centerTitle: true),
      body: Expanded(child: Text("data")),
    );
  }

  //make a list for data storing
  List<JsonDartModel> data = [];
  //get post api
  Future<List<JsonDartModel>> getPostApi() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body.toString());
      for (Map i in body) {
        data.add(
          JsonDartModel.fromJson(i),
        ); //it will add first ,second,third, and so on which we called json object
      }
      return data;
    } else {
      return data;
    }
  }
}
