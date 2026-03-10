class JsonDartModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  JsonDartModel({this.userId, this.id, this.title, this.body});

  JsonDartModel.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
