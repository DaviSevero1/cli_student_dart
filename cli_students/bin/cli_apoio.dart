import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_apoio/cli_apoio.dart' as cli_apoio;
import 'package:cli_apoio/src/students/students_command.dart';

void main(List<String> arguments) {
  // final argParser = ArgParser();
  // argParser.addFlag('data', abbr: 'd');
  // argParser.addOption('name', abbr: 'n');
  // argParser.addOption('template', abbr: 't');
  // final argResults = argParser.parse(arguments);

  // print('${argResults['data']}');
  // print('${argResults['name']}');
  // print('${argResults['template']}');
  // print(arguments[1]);

  CommandRunner('ADF CLI', 'ADF CLI2')
    ..addCommand(StudentsCommand())
    ..run(arguments);
}
