import 'package:diagoto/screens/menu_principal.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const Diagoto());
}

class Diagoto extends StatelessWidget {
  const Diagoto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diagoto, Le Diagnostic Automobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}