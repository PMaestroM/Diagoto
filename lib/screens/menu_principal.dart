import 'package:diagoto/screens/creer_diagnostic.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagoto, Le Diagnostic Automobile'),
      ),
      body: Center(
        child: Text(
          'Bienvenue dans Diagoto',
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreerDiagnostic()),
            );
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}