import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wellness/home/homepage.dart';
import 'package:wellness/mapper/phase_mapper.dart';
import 'package:wellness/repository/phase_repository.dart';
import 'package:wellness/utils/colors.dart';
import 'package:wellness/utils/extensions.dart';

final phaseRepository = PhaseRepository();
final phaseMapper = PhaseMapper();
final phase = "follicular";

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setColors(phase);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

Future<void> setColors(String phaseId) async {
  phaseRepository.getPhaseById(phaseId).listen((event) {
    setColorsDependingOnPhase(phaseMapper.mapDTOToPhaseItem(event));
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor.toColor(),
      body: HomePage(currentPhaseId: phase,),
    );
  }
}
