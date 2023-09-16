// To parse this JSON data, do
//
//     final allAssociation = allAssociationFromJson(jsonString);

import 'dart:convert';

AllAssociation allAssociationFromJson(String str) => AllAssociation.fromJson(json.decode(str));

String allAssociationToJson(AllAssociation data) => json.encode(data.toJson());

class AllAssociation {
  List<Datum>? data;

  AllAssociation({
    this.data,
  });

  factory AllAssociation.fromJson(Map<String, dynamic> json) => AllAssociation(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? nameFr;
  String? nameAr;
  String? type;
  String? adresse;
  String? ville;
  String? pays;
  String? logo;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.nameFr,
    this.nameAr,
    this.type,
    this.adresse,
    this.ville,
    this.pays,
    this.logo,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nameFr: json["name_fr"],
    nameAr: json["name_ar"],
    type: json["type"],
    adresse: json["adresse"],
    ville: json["ville"],
    pays: json["pays"],
    logo: json["logo"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_fr": nameFr,
    "name_ar": nameAr,
    "type": type,
    "adresse": adresse,
    "ville": ville,
    "pays": pays,
    "logo": logo,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
