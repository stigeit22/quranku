// To parse this JSON data, do
//
//     final hadistBukahriModel = hadistBukahriModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HadistBukhariModel> hadistBukahriModelFromJson(String str) =>
    List<HadistBukhariModel>.from(
        json.decode(str).map((x) => HadistBukhariModel.fromJson(x)));

String hadistBukahriModelToJson(List<HadistBukhariModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HadistBukhariModel {
  HadistBukhariModel({
    required this.number,
    required this.arab,
    required this.id,
  });

  final int number;
  final String arab;
  final String id;

  factory HadistBukhariModel.fromJson(Map<String, dynamic> json) =>
      HadistBukhariModel(
        number: json["number"],
        arab: json["arab"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "arab": arab,
        "id": id,
      };
}
