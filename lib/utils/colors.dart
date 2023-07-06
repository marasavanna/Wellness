import '../model/Phase.dart';

var backgroundColor = '#faf0d3';
var accentColor = '#f7b974';


void setColorsDependingOnPhase(Phase phase) {
  backgroundColor = phase.backgroundColor;
  accentColor = phase.accentColor;
}