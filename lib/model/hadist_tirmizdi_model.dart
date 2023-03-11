// To parse this JSON data, do
//
//     final hadistTirmidziModel = hadistTirmidziModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HadistTirmidziModel> hadistTirmidziModelFromJson(String str) =>
    List<HadistTirmidziModel>.from(
        json.decode(str).map((x) => HadistTirmidziModel.fromJson(x)));

String hadistTirmidziModelToJson(List<HadistTirmidziModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HadistTirmidziModel {
  HadistTirmidziModel({
    required this.number,
    required this.arab,
    required this.id,
  });

  final int number;
  final String arab;
  final String id;

  factory HadistTirmidziModel.fromJson(Map<String, dynamic> json) =>
      HadistTirmidziModel(
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
