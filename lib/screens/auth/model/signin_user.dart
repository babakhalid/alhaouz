// To parse this JSON data, do
//
//     final signInUser = signInUserFromJson(jsonString);

import 'dart:convert';

SignInUser signInUserFromJson(String str) => SignInUser.fromJson(json.decode(str));

String signInUserToJson(SignInUser data) => json.encode(data.toJson());

class SignInUser {
  bool? success;
  String? token;
  User? user;

  SignInUser({
    this.success,
    this.token,
    this.user,
  });

  factory SignInUser.fromJson(Map<String, dynamic> json) => SignInUser(
    success: json["success"],
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? code;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? type;
  String? organisme;
  String? brand;
  String? category;
  dynamic apiToken;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.code,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.organisme,
    this.brand,
    this.category,
    this.apiToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    code: json["code"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    type: json["type"],
    organisme: json["organisme"],
    brand: json["brand"],
    category: json["category"],
    apiToken: json["api_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "code": code,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "type": type,
    "organisme": organisme,
    "brand": brand,
    "category": category,
    "api_token": apiToken,
  };
}
