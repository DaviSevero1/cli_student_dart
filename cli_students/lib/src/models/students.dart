import 'dart:convert';
import 'dart:indexed_db';
import 'dart:svg';

import 'address.dart';
import 'courses.dart';

class Students {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Courses> courses;
  final Addres addres;

  Students({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.addres,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'nameCourses': nameCourses,
      'courses': courses.map((curso) => curso.toMap()).toList(),
      'address': addres.toMap(),
    };

    if (age != null) {
      map['age'] = age;
    }

    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory Students.fromMap(Map<String, dynamic> map) {
    return Students(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'],
      nameCourses: List<String>.from((map['nameCourses'] ?? <String>[])),
      addres: Addres.fromMap(map['address'] ?? <String, dynamic>{}),
      courses: map['courses']
              ?.map<Courses>((cursoMap) => Courses.fromMap(cursoMap))
              .toList() ??
          <Courses>[],
    );
  }

  factory Students.fromJson(String json) => Students.fromMap(jsonDecode(json));
}
