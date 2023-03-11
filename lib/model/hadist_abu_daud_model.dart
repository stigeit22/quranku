// To parse this JSON data, do
//
//     final hadistAbuDaudModel = hadistAbuDaudModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HadistAbuDaudModel> hadistAbuDaudModelFromJson(String str) =>
    List<HadistAbuDaudModel>.from(
        json.decode(str).map((x) => HadistAbuDaudModel.fromJson(x)));

String hadistAbuDaudModelToJson(List<HadistAbuDaudModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HadistAbuDaudModel {
  HadistAbuDaudModel({
    required this.number,
    required this.arab,
    required this.id,
  });

  final int number;
  final String arab;
  final String id;

  factory HadistAbuDaudModel.fromJson(Map<String, dynamic> json) =>
      HadistAbuDaudModel(
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
