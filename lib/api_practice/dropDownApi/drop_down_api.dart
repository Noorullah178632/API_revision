import 'dart:convert';

import 'package:api_revision/api_practice/dropDownApi/drop_down_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownApiClass extends StatefulWidget {
  const DropDownApiClass({super.key});

  @override
  State<DropDownApiClass> createState() => _DropDownApiClassState();
}

class _DropDownApiClassState extends State<DropDownApiClass> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Use APIs in drop down button "),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: getDropApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("No Data Found"));
              }
              return DropdownButton(
                hint: Text("select a option"),
                value: selectedValue,
                isExpanded: true,
                items: snapshot.data!.map((item) {
                  return DropdownMenuItem(
                    value: item.id.toString(),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          child: Text(
                            item.id.toString(),
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(child: Text(item.title.toString())),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value.toString();
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }

  //list to store all the data
  List<DropDownApi> listData = [];
  //function to get values in the api
  Future<List<DropDownApi>> getDropApi() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    if (response.statusCode == 200) {
      listData.clear();
      List<dynamic> body = jsonDecode(response.body.toString());
      for (Map<String, dynamic> i in body) {
        listData.add(DropDownApi.fromJson(i));
      }
      return listData;
    } else {
      return listData;
    }
  }
}
