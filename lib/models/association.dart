// To parse this JSON data, do
//
//     final associations = associationsFromJson(jsonString);

import 'dart:convert';

Associations associationsFromJson(String str) => Associations.fromJson(json.decode(str));

String associationsToJson(Associations data) => json.encode(data.toJson());

class Associations {
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

  Associations({
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

  factory Associations.fromJson(Map<String, dynamic> json) => Associations(
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
  String? nameFr;
  String? nameAr;
  String? type;
  String? adresse;
  String? ville;
  String? pays;
  String? logo;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? phone;
  List<dynamic>? contacts;

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
    this.phone,
    this.contacts,
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
    phone: json["phone"],
    contacts: json["contacts"] == null ? [] : List<dynamic>.from(json["contacts"]!.map((x) => x)),
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
    "phone": phone,
    "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x)),
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
