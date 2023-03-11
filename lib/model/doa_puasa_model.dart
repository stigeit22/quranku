// To parse this JSON data, do
//
//     final doaPuasaModel = doaPuasaModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DoaPuasaModel doaPuasaModelFromJson(String str) =>
    DoaPuasaModel.fromJson(json.decode(str));

String doaPuasaModelToJson(DoaPuasaModel data) => json.encode(data.toJson());

class DoaPuasaModel {
  DoaPuasaModel({
    required this.data,
  });

  final List<Puasa> data;

  factory DoaPuasaModel.fromJson(Map<String, dynamic> json) => DoaPuasaModel(
        data: List<Puasa>.from(json["data"].map((x) => Puasa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Puasa {
  Puasa({
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

  factory Puasa.fromJson(Map<String, dynamic> json) => Puasa(
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
