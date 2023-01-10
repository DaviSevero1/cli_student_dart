import 'dart:convert';

class Courses {
  int id;
  String name;
  bool isStudents;

  Courses({
    required this.id,
    required this.name,
    required this.isStudents,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isStudents': isStudents,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Courses.fromMap(Map<String, dynamic> map) {
    return Courses(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      isStudents: map['isStudents'] ?? false,
    );
  }

  factory Courses.fromJson(String json) => Courses.fromMap(jsonDecode(json));
}
