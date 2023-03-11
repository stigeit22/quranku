// To parse this JSON data, do
//
//     final hadistIbnuMajahModel = hadistIbnuMajahModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HadistIbnuMajahModel> hadistIbnuMajahModelFromJson(String str) =>
    List<HadistIbnuMajahModel>.from(
        json.decode(str).map((x) => HadistIbnuMajahModel.fromJson(x)));

String hadistIbnuMajahModelToJson(List<HadistIbnuMajahModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HadistIbnuMajahModel {
  HadistIbnuMajahModel({
    required this.number,
    required this.arab,
    required this.id,
  });

  final int number;
  final String arab;
  final String id;

  factory HadistIbnuMajahModel.fromJson(Map<String, dynamic> json) =>
      HadistIbnuMajahModel(
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
