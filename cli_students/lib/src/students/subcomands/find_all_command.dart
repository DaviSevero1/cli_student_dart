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
  void run() {
    print('Rodando o find ALL');
  }
}
