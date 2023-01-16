import 'dart:io';

import 'package:args/command_runner.dart';

import '../../models/address.dart';
import '../../models/city.dart';
import '../../models/phone.dart';
import '../../models/students.dart';
import '../../repositories/product_repositories.dart';
import '../../repositories/student_repository.dart';

class InsertCommand extends Command {
  final StudentRepository studentRepository;
  final productRepository = ProductRepository();

  @override
  String get description => 'Insert Command';

  @override
  get name => 'insert';

  InsertCommand(this.studentRepository) {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
  }

  @override
  Future<void> run() async {
    final filePath = argResults?['file'];
    final students = File(filePath).readAsLinesSync();
    print('Aguarde');
    print('=====================');

    for (var student in students) {
      final studentData = student.split(';');
      final courseCsv = studentData[2].split(',').map((e) => e.trim()).toList();

      //print(courseCsv);

      final courseFutures = courseCsv.map((c) async {
        final course = await productRepository.findByName(c);
        course.isStudents = true;
        return course;
      }).toList();

      final courses = await Future.wait(courseFutures);


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
              ddd: int.parse(studentData[7]),
              phone: studentData[8],
            )),
      );

      await studentRepository.insert(studentModel);
    }
    print('-----------------------------------');
    print('Alunos adicionados com sucesso');
  }
}
