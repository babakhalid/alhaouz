// To parse this JSON data, do
//
//     final douar = douarFromJson(jsonString);

import 'dart:convert';

Douar douarFromJson(String str) => Douar.fromJson(json.decode(str));

String douarToJson(Douar data) => json.encode(data.toJson());

class Douar {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Douar({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Douar.fromJson(Map<String, dynamic> json) => Douar(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int? id;
  String? nomFr;
  String? nomAr;
  int? regionId;
  int? provinceId;
  int? circleId;
  int? codeCommune;
  String? douarMere;
  int? codeLocalite;
  String? typeLocalite;
  String? caractereZone;
  String? milieu;
  int? population;
  int? menage;
  String? latitude;
  String? longitude;
  String? dataStatus;
  String? status;
  String? supported;
  Region? region;
  Circle? province;
  Circle? circle;
  List<Contact>? contacts;
  List<Association>? associations;

  Datum({
    this.id,
    this.nomFr,
    this.nomAr,
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
    this.region,
    this.province,
    this.circle,
    this.contacts,
    this.associations,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nomFr: json["nom_fr"],
    nomAr: json["nom_ar"],
    regionId: json["region_id"],
    provinceId: json["province_id"],
    circleId: json["circle_id"],
    codeCommune: json["code_commune"],
    douarMere: json["douar_mere"],
    codeLocalite: json["code_localite"],
    typeLocalite: json["type_localite"],
    caractereZone: json["caractere_zone"],
    milieu: json["milieu"],
    population: json["population"],
    menage: json["menage"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    dataStatus: json["data_status"],
    status: json["status"],
    supported: json["supported"],
    region: json["region"] == null ? null : Region.fromJson(json["region"]),
    province: json["province"] == null ? null : Circle.fromJson(json["province"]),
    circle: json["circle"] == null ? null : Circle.fromJson(json["circle"]),
    contacts: json["contacts"] == null ? [] : List<Contact>.from(json["contacts"]!.map((x) => Contact.fromJson(x))),
    associations: json["associations"] == null ? [] : List<Association>.from(json["associations"]!.map((x) => Association.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom_fr": nomFr,
    "nom_ar": nomAr,
    "region_id": regionId,
    "province_id": provinceId,
    "circle_id": circleId,
    "code_commune": codeCommune,
    "douar_mere": douarMere,
    "code_localite": codeLocalite,
    "type_localite": typeLocalite,
    "caractere_zone": caractereZone,
    "milieu": milieu,
    "population": population,
    "menage": menage,
    "latitude": latitude,
    "longitude": longitude,
    "data_status": dataStatus,
    "status": status,
    "supported": supported,
    "region": region?.toJson(),
    "province": province?.toJson(),
    "circle": circle?.toJson(),
    "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x.toJson())),
    "associations": associations == null ? [] : List<dynamic>.from(associations!.map((x) => x.toJson())),
  };
}

class Association {
  int? id;
  String? nameFr;
  String? nameAr;
  String? type;
  String? adresse;
  String? ville;
  String? pays;
  String? logo;
  DateTime? createdAt;
  DateTime? updateAt;
  AssociationPivot? pivot;

  Association({
    this.id,
    this.nameFr,
    this.nameAr,
    this.type,
    this.adresse,
    this.ville,
    this.pays,
    this.logo,
    this.createdAt,
    this.updateAt,
    this.pivot,
  });

  factory Association.fromJson(Map<String, dynamic> json) => Association(
    id: json["id"],
    nameFr: json["name_fr"],
    nameAr: json["name_ar"],
    type: json["type"],
    adresse: json["adresse"],
    ville: json["ville"],
    pays: json["pays"],
    logo: json["logo"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updateAt: json["update_at"] == null ? null : DateTime.parse(json["update_at"]),
    pivot: json["pivot"] == null ? null : AssociationPivot.fromJson(json["pivot"]),
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
    "update_at": updateAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class AssociationPivot {
  int? doarId;
  int? assosiationId;

  AssociationPivot({
    this.doarId,
    this.assosiationId,
  });

  factory AssociationPivot.fromJson(Map<String, dynamic> json) => AssociationPivot(
    doarId: json["doar_id"],
    assosiationId: json["assosiation_id"],
  );

  Map<String, dynamic> toJson() => {
    "doar_id": doarId,
    "assosiation_id": assosiationId,
  };
}

class Circle {
  int? id;
  String? nameFr;
  String? nameAr;
  int? regionId;
  int? provinceId;

  Circle({
    this.id,
    this.nameFr,
    this.nameAr,
    this.regionId,
    this.provinceId,
  });

  factory Circle.fromJson(Map<String, dynamic> json) => Circle(
    id: json["id"],
    nameFr: json["name_fr"],
    nameAr: json["name_ar"],
    regionId: json["region_id"],
    provinceId: json["province_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_fr": nameFr,
    "name_ar": nameAr,
    "region_id": regionId,
    "province_id": provinceId,
  };
}

class Contact {
  int? id;
  String? nameFr;
  String? nameAr;
  String? phone1;
  String? phone2;
  String? function;
  int? typeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  ContactPivot? pivot;

  Contact({
    this.id,
    this.nameFr,
    this.nameAr,
    this.phone1,
    this.phone2,
    this.function,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"],
    nameFr: json["name_fr"],
    nameAr: json["name_ar"],
    phone1: json["phone_1"],
    phone2: json["phone_2"],
    function: json["function"],
    typeId: json["type_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : ContactPivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_fr": nameFr,
    "name_ar": nameAr,
    "phone_1": phone1,
    "phone_2": phone2,
    "function": function,
    "type_id": typeId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class ContactPivot {
  int? doarId;
  int? contactId;

  ContactPivot({
    this.doarId,
    this.contactId,
  });

  factory ContactPivot.fromJson(Map<String, dynamic> json) => ContactPivot(
    doarId: json["doar_id"],
    contactId: json["contact_id"],
  );

  Map<String, dynamic> toJson() => {
    "doar_id": doarId,
    "contact_id": contactId,
  };
}

class Region {
  int? id;
  String? name;
  String? nameAr;

  Region({
    this.id,
    this.name,
    this.nameAr,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"],
    name: json["name"],
    nameAr: json["name_ar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_ar": nameAr,
  };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
