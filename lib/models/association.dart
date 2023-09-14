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
  dynamic nextPageUrl;
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
  DateTime? updateAt;
  List<Contact>? contacts;

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
    this.updateAt,
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
    updateAt: json["update_at"] == null ? null : DateTime.parse(json["update_at"]),
    contacts: json["contacts"] == null ? [] : List<Contact>.from(json["contacts"]!.map((x) => Contact.fromJson(x))),
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
    "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x.toJson())),
  };
}

class Contact {
  int? id;
  String? nameFr;
  String? nameAr;
  dynamic phone1;
  dynamic phone2;
  dynamic function;
  dynamic typeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

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
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
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

class Pivot {
  int? assosiationId;
  int? contactId;

  Pivot({
    this.assosiationId,
    this.contactId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    assosiationId: json["assosiation_id"],
    contactId: json["contact_id"],
  );

  Map<String, dynamic> toJson() => {
    "assosiation_id": assosiationId,
    "contact_id": contactId,
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
