import 'package:wellness/enum/enum_phase.dart';

class Phase {
  String description;
  String name;
  String backgroundColor;
  String accentColor;

  Phase({required this.name, required this.description, required this.backgroundColor, required this.accentColor});

  PhaseEnum getEnum() => PhaseEnum.values.firstWhere((element) => element.name.toLowerCase() == name);
}
