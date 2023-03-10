import 'dart:convert';

List<Welcome?>? welcomeFromJson(String str) => json.decode(str) == null ? [] : List<Welcome?>.from(json.decode(str)!.map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class Welcome {
  Welcome({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
