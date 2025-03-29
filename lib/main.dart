import 'package:flutter/material.dart';
import 'package:flutter_application_16/homescreen.dart';
import 'package:flutter_application_16/instructionscreen.dart';
import 'package:flutter_application_16/gamescreen.dart';
import 'package:flutter_application_16/endscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App 6',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(70, 29, 124, 1)),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/htp": (context) => const InstructionScreen(),
        "/game": (context) => const GameScreen(),
        "/end": (context) => const EndScreen(),
      },
    );
  }
}