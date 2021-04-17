// To parse this JSON data, do
//
//     final appUser = appUserFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

AppUser appUserFromJson(String str) => AppUser.fromJson(json.decode(str));

String appUserToJson(AppUser data) => json.encode(data.toJson());

class AppUser {
    AppUser({
        this.name,
        this.birthdate,
        this.bio,
        this.profilePicture,
        this.isplus,
        this.email,
    });

    String name;
    Timestamp birthdate;
    String bio;
    String profilePicture;
    bool isplus;
    String email;

    factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        name: json["name"],
        birthdate: json["birthdate"],
        bio: json["bio"],
        profilePicture: json["profilePicture"],
        isplus: json["isplus"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "birthdate": birthdate,
        "bio": bio,
        "profilePicture": profilePicture,
        "isplus": isplus,
        "email": email,
    };
}
