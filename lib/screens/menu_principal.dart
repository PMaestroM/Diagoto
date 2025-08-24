import 'package:diagoto/models/diagnostic.dart';
import 'package:diagoto/screens/creer_diagnostic.dart';
import 'package:diagoto/services/json_storage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final JsonStorage storage = JsonStorage();
  List<Diagnostic> diagnostics = [];
  
  @override
  void initState() {
    super.initState();
    _loadDiagnostics();
  }

  Future<void> _loadDiagnostics() async {
    final loaded = await storage.loadAllDiagnostics();
    setState(() {
      diagnostics = loaded;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (diagnostics.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Diagoto, Le Diagnostic Automobile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Aucun diagnostic trouvé.',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreerDiagnostic()),
                  );
                  _loadDiagnostics();
                },
                child: const Text('Créer un nouveau diagnostic'),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagoto, Le Diagnostic Automobile'),
      ),
      body: ListView.builder(
        itemCount: diagnostics.length,
        itemBuilder: (context, index) {
          final diagnostic = diagnostics[index];
          return ListTile(
            title: Text('${diagnostic.automobile.marque} ${diagnostic.automobile.modele}'),
            subtitle: Text('Immatriculation: ${diagnostic.automobile.immatriculation}'),
            // onTap: () {
            //   // Action when tapping on a diagnostic (e.g., view details)
            // },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreerDiagnostic()),
          );
          _loadDiagnostics();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}