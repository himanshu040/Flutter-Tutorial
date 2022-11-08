// To parse this JSON data, do
//
//     final videomodel = videomodelFromJson(jsonString);

import 'dart:convert';

Videomodel videomodelFromJson(String str) => Videomodel.fromJson(json.decode(str));

String videomodelToJson(Videomodel data) => json.encode(data.toJson());

class Videomodel {
  Videomodel({
    required this.data,
  });

  List<Datum> data;

  factory Videomodel.fromJson(Map<String, dynamic> json) => Videomodel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
    required this.video,
    required this.thumbnail,
  });

  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> url;
  List<String> video;
  List<String> thumbnail;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    url: List<String>.from(json["url"].map((x) => x)),
    video: List<String>.from(json["video"].map((x) => x)),
    thumbnail: List<String>.from(json["thumbnail"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "url": List<dynamic>.from(url.map((x) => x)),
    "video": List<dynamic>.from(video.map((x) => x)),
    "thumbnail": List<dynamic>.from(thumbnail.map((x) => x)),
  };
}
