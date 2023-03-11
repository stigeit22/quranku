// To parse this JSON data, do
//
//     final hadistAhmadModel = hadistAhmadModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HadistAhmadModel> hadistAhmadModelFromJson(String str) =>
    List<HadistAhmadModel>.from(
        json.decode(str).map((x) => HadistAhmadModel.fromJson(x)));

String hadistAhmadModelToJson(List<HadistAhmadModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HadistAhmadModel {
  HadistAhmadModel({
    required this.number,
    required this.arab,
    required this.id,
  });

  final int number;
  final String arab;
  final String id;

  factory HadistAhmadModel.fromJson(Map<String, dynamic> json) =>
      HadistAhmadModel(
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
