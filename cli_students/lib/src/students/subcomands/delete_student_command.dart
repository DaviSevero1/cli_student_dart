import 'dart:io';

import 'package:args/command_runner.dart';

import '../../models/students.dart';
import '../../repositories/product_repositories.dart';
import '../../repositories/student_repository.dart';
// import 'insert_command.dart';

class DeleteById extends Command {
  final StudentRepository studentRepository;
  final productRepository = ProductRepository();

  @override
  String get description => 'Delete Command';

  @override
  String get name => 'delete';

  DeleteById(this.studentRepository) {
    argParser.addOption('delete', help: 'Option', abbr: 'd');
    argParser.addOption('id', help: 'Insert id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    print('Aguarde...');
    final studentId = int.tryParse(argResults?['id']);

    if (studentId == null) {
      print('Por favor informe o id do aluno');
      return;
    }

    final student = await studentRepository.findById(studentId);

    print('Voce realmente deseja ecxluir o aluno ${student.name}?  (S) ou (N)');
    final confirmation = stdin.readLineSync();

    if (confirmation?.toLowerCase() == 's') {
      await studentRepository.deleteById(studentId);
      print('===========================');
      print('Aluno excluído com sucesso');
      print('===========================');
    } else {
      print('===========================');
      print('Operação Cancelada!!!!');
      print('===========================');
      return;
    }
  }
}
