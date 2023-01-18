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
    final id = argResults?['id'];

    if (id == null) {
      print('Por favor informe o id do aluno com o comando --id=0 ou -i 0');
    }
      print(filePath);


    final students = File(filePath).readAsLinesSync();
    print(students);

    print('Aguarde, atualizando dados do aluno...');
    print('===========================');

    if (students.length > 1) {
      print('Por favor informe, apenas, um alunos');
      return;
    } else if (students.isEmpty) {
      print('Informe um aluno no arguivo $filePath');
      return;
    }

    var student = students.first;

    final studentData = student.split(';');
    final courseCsv = studentData[2].split(',').map((e) => e.trim()).toList();

    // ignore: non_constant_identifier_names
    final CourseFutures = courseCsv.map((c) async {
      final course = await productRepository.findByName(c);
      course.isStudents = true;
      return course;
    }).toList();

    final courses = await Future.wait(CourseFutures);

    final studentModel = Students(
        id: int.parse(id),
        name: studentData[0],
        age: int.tryParse(studentData[1]),
        nameCourses: courseCsv,
        courses: courses,
        addres: Addres(
            street: studentData[3],
            number: int.parse(studentData[4]),
            zipcode: studentData[5],
            city: City(id: 1, nome: studentData[6]),
            phone:
                Phone(ddd: int.parse(studentData[7]), phone: studentData[8])));
    await studentRepository.update(studentModel);

    print('Alterado com sucesso');
  }
}
