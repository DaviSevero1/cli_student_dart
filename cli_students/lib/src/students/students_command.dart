import 'package:args/command_runner.dart';
import 'package:cli_apoio/src/students/subcomands/delete_student_command.dart';
import 'package:cli_apoio/src/students/subcomands/find_all_command.dart';

import '../repositories/student_repository.dart';
import 'subcomands/find_by_id_command.dart';
import 'subcomands/insert_command.dart';
import 'subcomands/update_command.dart';

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
    addSubcommand(FindByIdCommand(studentRepository));
    addSubcommand(InsertCommand(studentRepository));
    addSubcommand(UpdateCommand(studentRepository));
    addSubcommand(DeleteById(studentRepository));
  }
}
