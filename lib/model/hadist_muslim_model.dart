// To parse this JSON data, do
//
//     final hadistMuslimModel = hadistMuslimModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HadistMuslimModel> hadistMuslimModelFromJson(String str) =>
    List<HadistMuslimModel>.from(
        json.decode(str).map((x) => HadistMuslimModel.fromJson(x)));

String hadistMuslimModelToJson(List<HadistMuslimModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HadistMuslimModel {
  HadistMuslimModel({
    required this.number,
    required this.arab,
    required this.id,
  });

  final int number;
  final String arab;
  final String id;

  factory HadistMuslimModel.fromJson(Map<String, dynamic> json) =>
      HadistMuslimModel(
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
