import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_apoio/cli_apoio.dart' as cli_apoio;

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
    ..addCommand(ExemploCommand())
    ..run(arguments);
}

class ExemploCommand extends Command {
  @override
  // TODO: implement description
  String get description => 'Exemplo de Comando';

  @override
  // TODO: implement name
  String get name => 'exemplo';

  ExemploCommand() {
    argParser.addOption('template',
        abbr: 't', help: 'Template de criacao de projeto');
  }

  @override
  void run() {
    print(argResults?['template']);
    print('Executar qualquer coisa');
  }
}
