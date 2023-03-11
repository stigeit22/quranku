// To parse this JSON data, do
//
//     final doaHarianModel = doaHarianModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DoaHarianModel doaHarianModelFromJson(String str) =>
    DoaHarianModel.fromJson(json.decode(str));

String doaHarianModelToJson(DoaHarianModel data) => json.encode(data.toJson());

class DoaHarianModel {
  DoaHarianModel({
    required this.data,
  });

  final List<Doa> data;

  factory DoaHarianModel.fromJson(Map<String, dynamic> json) => DoaHarianModel(
        data: List<Doa>.from(json["data"].map((x) => Doa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Doa {
  Doa({
    required this.id,
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
  });

  final int id;
  final String title;
  final String arabic;
  final String latin;
  final String translation;

  factory Doa.fromJson(Map<String, dynamic> json) => Doa(
        id: json["id"],
        title: json["title"],
        arabic: json["arabic"],
        latin: json["latin"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "arabic": arabic,
        "latin": latin,
        "translation": translation,
      };
}
