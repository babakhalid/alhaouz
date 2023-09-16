// To parse this JSON data, do
//
//     final allDoars = allDoarsFromJson(jsonString);

import 'dart:convert';

AllDoars allDoarsFromJson(String str) => AllDoars.fromJson(json.decode(str));

String allDoarsToJson(AllDoars data) => json.encode(data.toJson());

class AllDoars {
  List<Datum>? data;

  AllDoars({
    this.data,
  });

  factory AllDoars.fromJson(Map<String, dynamic> json) => AllDoars(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? nomFr;
  String? nomAr;
  Zone? zone;
  int? regionId;
  int? provinceId;
  int? circleId;
  int? codeCommune;
  String? douarMere;
  int? codeLocalite;
  TypeLocalite? typeLocalite;
  CaractereZone? caractereZone;
  Milieu? milieu;
  int? population;
  int? menage;
  String? latitude;
  String? longitude;
  DataStatus? dataStatus;
  String? status;
  String? supported;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.nomFr,
    this.nomAr,
    this.zone,
    this.regionId,
    this.provinceId,
    this.circleId,
    this.codeCommune,
    this.douarMere,
    this.codeLocalite,
    this.typeLocalite,
    this.caractereZone,
    this.milieu,
    this.population,
    this.menage,
    this.latitude,
    this.longitude,
    this.dataStatus,
    this.status,
    this.supported,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nomFr: json["nom_fr"],
    nomAr: json["nom_ar"],
    zone: zoneValues.map[json["zone"]]!,
    regionId: json["region_id"],
    provinceId: json["province_id"],
    circleId: json["circle_id"],
    codeCommune: json["code_commune"],
    douarMere: json["douar_mere"],
    codeLocalite: json["code_localite"],
    typeLocalite: typeLocaliteValues.map[json["type_localite"]]!,
    caractereZone: caractereZoneValues.map[json["caractere_zone"]]!,
    milieu: milieuValues.map[json["milieu"]]!,
    population: json["population"],
    menage: json["menage"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    dataStatus: dataStatusValues.map[json["data_status"]]!,
    status: json["status"],
    supported: json["supported"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom_fr": nomFr,
    "nom_ar": nomAr,
    "zone": zoneValues.reverse[zone],
    "region_id": regionId,
    "province_id": provinceId,
    "circle_id": circleId,
    "code_commune": codeCommune,
    "douar_mere": douarMere,
    "code_localite": codeLocalite,
    "type_localite": typeLocaliteValues.reverse[typeLocalite],
    "caractere_zone": caractereZoneValues.reverse[caractereZone],
    "milieu": milieuValues.reverse[milieu],
    "population": population,
    "menage": menage,
    "latitude": latitude,
    "longitude": longitude,
    "data_status": dataStatusValues.reverse[dataStatus],
    "status": status,
    "supported": supported,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum CaractereZone {
  EMPTY,
  RURAL_ZONE_URB
}

final caractereZoneValues = EnumValues({
  "": CaractereZone.EMPTY,
  "rural_zone_urb": CaractereZone.RURAL_ZONE_URB
});

enum DataStatus {
  DOUBLE,
  EMPTY,
  OK
}

final dataStatusValues = EnumValues({
  "double": DataStatus.DOUBLE,
  "": DataStatus.EMPTY,
  "ok": DataStatus.OK
});

enum Milieu {
  RURAL,
  URBAIN
}

final milieuValues = EnumValues({
  "rural": Milieu.RURAL,
  "urbain": Milieu.URBAIN
});

enum TypeLocalite {
  DOUAR,
  LOCALITE,
  SOUS_DOUAR
}

final typeLocaliteValues = EnumValues({
  "douar": TypeLocalite.DOUAR,
  "localite": TypeLocalite.LOCALITE,
  "sous-douar": TypeLocalite.SOUS_DOUAR
});

enum Zone {
  THE_010_KM_ZONE_D_IMPACT_DIRECT,
  THE_1030_KM_ZONE_A_RISQUE_TRES_ELEVE,
  THE_3050_ZONE_A_RISQUE_LEV,
  THE_50100_ZONE_A_RISQUE_MODERE
}

final zoneValues = EnumValues({
  "0 - 10km_zone d'impact direct": Zone.THE_010_KM_ZONE_D_IMPACT_DIRECT,
  "10-30Km zone a risque tres eleve": Zone.THE_1030_KM_ZONE_A_RISQUE_TRES_ELEVE,
  "30-50 zone a risque élevé": Zone.THE_3050_ZONE_A_RISQUE_LEV,
  "50 -100 zone a risque modere": Zone.THE_50100_ZONE_A_RISQUE_MODERE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
