import 'package:args/args.dart';
import 'package:iconfont_convert_flutter/iconfont_convert_flutter.dart';
import 'package:iconfont_convert_flutter/src/pub.dart';

void main(List<String> args) async {
  final ArgParser argParser = ArgParser()
    ..addOption('config', abbr: 'c', defaultsTo: Constants.pubspecConfig, help: "config file path")
    ..addFlag('help', abbr: 'h', negatable: false, help: "help");

  ArgResults argResults = argParser.parse(args);
  if (argResults['help']) {
    print(argParser.usage);
    return;
  }

  try {
    await IconFontBuilder.buildFromYamlConfig(argResults['config']);
    await Pub.save();
  } catch (e, s) {
    print(e.toString());
    print(s.toString());
  }
}
