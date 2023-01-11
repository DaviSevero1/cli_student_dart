import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/students.dart';

class StudentRepository {
  Future<List<Students>> findAll() async {
    final studentsResult =
        await http.get(Uri.parse('http://localhost:8080/students'));

    if (studentsResult.statusCode != 200) {
      throw Exception('Não achei os ');
    }

    final studentsData = jsonDecode(studentsResult.body);

    return studentsData.map<Students>((students) {
      return Students.fromMap(students);
    }).toList();
  }

  Future<Students> findById(int id) async {
    final studentResult =
        await http.get(Uri.parse('http://localhost:8080/students/$id'));
    if (studentResult.statusCode != 200) {
      throw Exception();
    }

    return Students.fromJson(studentResult.body);
  }

  Future<void> insert(Students student) async {
    final response = await http.post(
        Uri.parse('http://localhost:8080/students'),
        body: student.toJson(),
        headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> update(Students student) async {
    final response = await http.put(
        Uri.parse('http://localhost:8080/students/${student.id}'),
        body: student.toJson(),
        headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    final response =
        await http.delete(Uri.parse("http://localhost:8080/students/$id"));

    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
