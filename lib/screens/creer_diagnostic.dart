import 'package:diagoto/models/automobile.dart';
import 'package:diagoto/models/controle_securite/carrosserie.dart';
import 'package:diagoto/models/controle_securite/freins.dart';
import 'package:diagoto/models/controle_securite/phares_signalisation.dart';
import 'package:diagoto/models/controle_securite/pneus.dart';
import 'package:diagoto/models/controle_securite/suspension_direction.dart';
import 'package:diagoto/models/diagnostic.dart';
import 'package:diagoto/models/securite.dart';
import 'package:diagoto/screens/controle_essentiels_securite.dart';
import 'package:diagoto/services/json_storage.dart';
import 'package:flutter/material.dart';

class CreerDiagnostic extends StatefulWidget {
  const CreerDiagnostic({super.key});

  @override
  State<CreerDiagnostic> createState() => _CreerDiagnosticState();
}

class _CreerDiagnosticState extends State<CreerDiagnostic> {
  final storage = JsonStorage();
  final _formKey = GlobalKey<FormState>();
  String? _immatriculation;
  String? _marque;
  String? _modele;
  String? _kilometrage;
  String? _typeCarburant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un Diagnostic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Immatriculation'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer l\'immatriculation';
                  }
                  return null;
                },
                onSaved: (value) => _immatriculation = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Marque'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la marque';
                  }
                  return null;
                },
                onSaved: (value) => _marque = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Modèle'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le modèle';
                  }
                  return null;
                },
                onSaved: (value) => _modele = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kilométrage'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le kilométrage';
                  }
                  return null;
                },
                onSaved: (value) => _kilometrage = value,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Type de Carburant'),
                items: const [
                  DropdownMenuItem(value: 'Essence', child: Text('Essence')),
                  DropdownMenuItem(value: 'Diesel', child: Text('Diesel')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                  return 'Veuillez sélectionner le type de carburant';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                  _typeCarburant = value;
                  });
                },
                onSaved: (value) => _typeCarburant = value,
                value: _typeCarburant,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Diagnostic diagnostic = Diagnostic(
              date: DateTime.now(),
              automobile: Automobile(
                immatriculation: _immatriculation!,
                marque: _marque!,
                modele: _modele!,
                kilometrage: _kilometrage!,
                typeCarburant: _typeCarburant!,
              ),
              securite: Securite(
                carrosserie: Carrosserie(),
                freins: Freins(),
                pharesSignalisation: PharesSignalisation(),
                pneus: Pneus(),
                suspensionDirection: SuspensionDirection(),
              ), // Initialisé avec des valeurs par défaut
            );
            storage.saveDiagnostic(diagnostic);
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ControleEssentielsSecurite(diagnostic: diagnostic)),
            );
          }
        },
        child: const Icon(Icons.keyboard_double_arrow_right),
      ),
    );
  }
}