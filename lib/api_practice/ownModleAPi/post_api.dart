import 'dart:convert';

import 'package:api_revision/api_practice/ownModleAPi/model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Make Own Model For Api"), centerTitle: true),
      body: FutureBuilder(
        future: getApi(),
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
              return ListTile(
                title: Text("Title ${snapshot.data![index].title}"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    snapshot.data![index].thumbnailUrl.toString(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<PhotoModel>> getApi() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/photos"),
    );
    final body = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in body) {
        PhotoModel photo = PhotoModel(
          id: i["id"],
          title: i["title"],
          url: i["url"],
          thumbnailUrl: i["thumbnailUrl"],
        );
        data.add(photo);
      }
      return data;
    } else {
      return data;
    }
  }

  //list of photo models
  List<PhotoModel> data = [];
}
