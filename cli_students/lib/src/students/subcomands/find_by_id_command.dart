import 'package:args/command_runner.dart';

import '../../repositories/student_repository.dart';
import '../students_command.dart';

class FindByIdCommand extends Command {
  final StudentRepository studentsRepository;

  @override
  // TODO: implement description
  String get description => 'Find Student By ID';

  @override
  // TODO: implement name
  String get name => 'byID';

  FindByIdCommand(this.studentsRepository) {
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('Por Favor, envie o id do aluno com o comando --id=0 ou -i 0');
      return;
    }

    final id = int.parse(argResults?['id']);

    print('Aguarde buscando dados...');
    final student = await studentsRepository.findById(id);
    print('==========================');
    print('Aluno: ${student.name}');
    print('Idade: ${student.age ?? 'Nao informado'}');
    print('Cursos: ');
    student.nameCourses.forEach(print);
    print('Endereco: ${student.addres.street} ${student.addres.zipcode}');
  }
}
