// To parse this JSON data, do
//
//     final niatSholatModel = niatSholatModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<NiatSholatModel> niatSholatModelFromJson(String str) =>
    List<NiatSholatModel>.from(
        json.decode(str).map((x) => NiatSholatModel.fromJson(x)));

String niatSholatModelToJson(List<NiatSholatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NiatSholatModel {
  NiatSholatModel({
    required this.id,
    required this.name,
    required this.arabic,
    required this.latin,
    required this.terjemahan,
  });

  final int id;
  final String name;
  final String arabic;
  final String latin;
  final String terjemahan;

  factory NiatSholatModel.fromJson(Map<String, dynamic> json) =>
      NiatSholatModel(
        id: json["id"],
        name: json["name"],
        arabic: json["arabic"],
        latin: json["latin"],
        terjemahan: json["terjemahan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "arabic": arabic,
        "latin": latin,
        "terjemahan": terjemahan,
      };
}
