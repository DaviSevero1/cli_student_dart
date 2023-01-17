import 'dart:io';

import 'package:args/command_runner.dart';

import '../../models/address.dart';
import '../../models/city.dart';
import '../../models/phone.dart';
import '../../models/students.dart';
import '../../repositories/product_repositories.dart';
import '../../repositories/student_repository.dart';

class UpdateCommand extends Command {
  StudentRepository studentRepository;

  final productRepository = ProductRepository();

  @override
  String get description => 'Update Student';

  @override
  String get name => 'update';

  UpdateCommand(this.studentRepository) {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }

  @override
  Future<void> run() async {
    print('Aguarde');
    final filePath = argResults?['file'];
    final students = File(filePath).readAsLinesSync();
    print('===========================');

    for (var student in students) {
      final studentData = student.split(';');
      final courseCsv = studentData[2].split(',').map((e) => e.trim()).toList();

      final CourseFutures = courseCsv.map((c) async {
        final course = await productRepository.findByName(c);
        course.isStudents = true;
        return course;
      }).toList();

      final courses = await Future.wait(CourseFutures);

      final studentModel = Students(
          name: studentData[0],
          age: int.tryParse(studentData[1]),
          nameCourses: courseCsv,
          courses: courses,
          addres: Addres(
              street: studentData[3],
              number: int.parse(studentData[4]),
              zipcode: studentData[5],
              city: City(id: 1, nome: studentData[6]),
              phone: Phone(
                  ddd: int.parse(studentData[7]), phone: studentData[8])));
      await studentRepository.insert(studentModel);
    }
    print('Alterado com sucesso');
  }
}
