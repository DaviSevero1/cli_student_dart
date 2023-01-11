import 'package:args/command_runner.dart';
import 'package:cli_apoio/src/students/subcomands/find_all_command.dart';

import '../repositories/student_repository.dart';

class StudentsCommand extends Command {
  @override
  // TODO: implement description
  String get description => ('Students Operations');

  @override
  // TODO: implement name
  String get name => ('students');

  StudentsCommand() {
    final studentRepository = StudentRepository();
    addSubcommand(FindAllCommand(studentRepository));
  }
}
