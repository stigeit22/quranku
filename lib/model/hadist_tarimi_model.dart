// To parse this JSON data, do
//
//     final hadistTarimiModel = hadistTarimiModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HadistTarimiModel> hadistTarimiModelFromJson(String str) =>
    List<HadistTarimiModel>.from(
        json.decode(str).map((x) => HadistTarimiModel.fromJson(x)));

String hadistTarimiModelToJson(List<HadistTarimiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HadistTarimiModel {
  HadistTarimiModel({
    required this.number,
    required this.arab,
    required this.id,
  });

  final int number;
  final String arab;
  final String id;

  factory HadistTarimiModel.fromJson(Map<String, dynamic> json) =>
      HadistTarimiModel(
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
