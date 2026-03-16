import 'dart:convert';

import 'package:api_revision/api_practice/normalApi/json_dart_model.dart';
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
      appBar: AppBar(title: Text("Get Api Call "), centerTitle: true),
      body: FutureBuilder(
        future: getPostApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.blue));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No Data Found"));
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Text("id:  ${data[index].id}"),
                    Text("id:  ${data[index].id}"),
                    Text("id:  ${data[index].id}"),
                    Text("title:  ${data[index].title}"),
                    Text("title:  ${data[index].title}"),
                    Text("body: ${data[index].body}"),
                  ],
                ),
              );
            },
          );
        },
      ),
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
        //it will take the raw data then with the help of jsonDartModel we will use it in a dart object
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
