import 'package:flutter/material.dart';
import 'package:flutter_tentativa_1/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo App',
      home: Home(),
    );
  }
}
