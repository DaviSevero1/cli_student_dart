import 'dart:convert';

import 'city.dart';
import 'phone.dart';

class Addres {
  final String street;
  final int number;
  final String zipcode;
  final City city;
  final Phone phone;

  Addres(
      {required this.street,
      required this.number,
      required this.zipcode,
      required this.city,
      required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'number': number,
      'zipcode': zipcode,
      'city': city.toMap(),
      'phone': phone.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Addres.fromMap(Map<String, dynamic> map) {
    return Addres(
      street: map['street'],
      number: map['number'],
      zipcode: map['zipcode'],
      city: City.fromMap(map['city'] ?? <String, dynamic>{}),
      phone: Phone.fromMap(map['Phone'] ?? <String, dynamic>{}),
    );
  }

  factory Addres.fromJson(String json) => Addres.fromMap(jsonDecode(json));
}
