import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

class Users {
  final int id;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;
  Users(this.id, this.username, this.email, this.address, this.phone,
      this.website, this.company);
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'address': address?.toJson(),
      'phone': phone,
      'website': website,
      'company': company?.toJson(),
    };
  }

  factory Users.fromJson(dynamic json) {
    return Users(
      json["id"],
      json["username"],
      json["email"],
      json["address"],
      json["phone"],
      json["website"],
      json["company"],
    );
  }
}

class GeoLocation {
  final double latitude;
  final double longitude;
  GeoLocation({
    this.latitude = 0.00,
    this.longitude = 0.00,
  });
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
  });
  Map<String, dynamic> toJson() {
    return {
      "street": street,
      "suite": suite,
      "city": city,
      "zipcode": zipcode,
    };
  }
}

class Company {
  final String? name;
  final String? catchPharse;
  final String? bs;
  Company({this.name, this.catchPharse, this.bs});
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "catchPharse": catchPharse,
      "bs": bs,
    };
  }
}
