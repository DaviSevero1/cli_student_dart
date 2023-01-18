import 'package:args/command_runner.dart';

import '../../repositories/product_repositories.dart';
import '../../repositories/student_repository.dart';
import 'insert_command.dart';

class DeleteById extends Command {
  final StudentRepository studentRepository;
  final productRepository = ProductRepository();

  @override
  String get description => 'Delete Command';

  @override
  String get name => 'delete';

  DeleteById(this.studentRepository) {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
  }

  @override
  void run() {
    print('Aguarde...');
    final studentId = argResults?['id'];

    if (studentId == null) {
      print('Aluno não encontrado.');
      return;
    }

    studentRepository.deleteById(studentId);
  }
}
