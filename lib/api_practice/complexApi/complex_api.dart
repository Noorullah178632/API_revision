import 'dart:convert';

import 'package:api_revision/api_practice/complexApi/model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplexApi extends StatefulWidget {
  const ComplexApi({super.key});

  @override
  State<ComplexApi> createState() => _ComplexApiState();
}

class _ComplexApiState extends State<ComplexApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Complex Api"), centerTitle: true),
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
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    ReuseRow(name: "Name", value: snapshot.data![index].name!),
                    ReuseRow(
                      name: "address",
                      value:
                          snapshot.data![index].address!.street! +
                          snapshot.data![index].address!.zipcode!,
                    ),
                    ReuseRow(
                      name: "lat lng",
                      value:
                          "${snapshot.data![index].address!.geo!.lat!}   ${snapshot.data![index].address!.geo!.lng!}",
                    ),
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
  List<ComplexDart> data = [];
  //get post api
  Future<List<ComplexDart>> getPostApi() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body.toString());
      for (Map i in body) {
        //it will take the raw data then with the help of ComplexDart  we will use it in a dart object
        data.add(
          ComplexDart.fromJson(i),
        ); //it will add first ,second,third, and so on which we called json object
      }
      return data;
    } else {
      return data;
    }
  }
}

// ignore: must_be_immutable
class ReuseRow extends StatelessWidget {
  String name, value;

  ReuseRow({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [Text(name), Text(value)],
    );
  }
}
