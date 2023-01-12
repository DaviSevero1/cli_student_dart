import 'dart:io';

import 'package:args/command_runner.dart';

import '../../repositories/student_repository.dart';

class FindAllCommand extends Command {
  final StudentRepository repository;

  @override
  // TODO: implement description
  String get description => 'find all Students';

  @override
  // TODO: implement name
  String get name => 'findAll';

  FindAllCommand(this.repository);

  @override
  Future<void> run() async {
    print('Buscando alunos...');
    final students = await repository.findAll();
    print('Apresentar também os cursos? (S ou N)');

    final showCourses = stdin.readLineSync();
    print('----------------------------------');
    print('Alunos:');
    print('----------------------------------');

    for (var student in students) {
      if (showCourses?.toLowerCase() == 's') {
        print(
            '${student.id} - ${student.name} - ${student.courses.where((course) => course.isStudents).map((e) => e.name).toList()} - ${student.nameCourses}');
      } else {
        print('${student.id} - ${student.name}');
      }
    }
  }
}
