// To parse this JSON data, do
//
//     final bacaanSholatModel = bacaanSholatModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<BacaanSholatModel> bacaanSholatModelFromJson(String str) =>
    List<BacaanSholatModel>.from(
        json.decode(str).map((x) => BacaanSholatModel.fromJson(x)));

String bacaanSholatModelToJson(List<BacaanSholatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BacaanSholatModel {
  BacaanSholatModel({
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

  factory BacaanSholatModel.fromJson(Map<String, dynamic> json) =>
      BacaanSholatModel(
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
