import 'package:diagoto/models/optimiser_performances/moteur_huile.dart';
import 'package:diagoto/services/json_storage.dart';
import 'package:flutter/material.dart';

class OptimiserPerformances extends StatefulWidget {
  const OptimiserPerformances({super.key});

  @override
  State<OptimiserPerformances> createState() => _OptimiserPerformancesState();
}

class _OptimiserPerformancesState extends State<OptimiserPerformances> {
  final storage = JsonStorage();
  final _formKey = GlobalKey<FormState>();
  String? _moteur;
  String? _huile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les vérifications pour optimiser les performances'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Moteur et Huile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Moteur', 
                  helperText: "Vérifiez l’état général du moteur pour détecter d’éventuelles fuites ou anomalies.",
                  ),
                onSaved: (value) => _moteur = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Huile',
                  helperText: "Vérifiez le niveau d’huile moteur et complétez-le si nécessaire. Un niveau d’huile adéquat est crucial pour le bon fonctionnement du moteur.",
                  ),
                onSaved: (value) => _huile = value,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            MoteurHuile moteurHuile = MoteurHuile(
              moteur: _moteur,
              huile: _huile,
            );
          }
        },
        child: const Icon(Icons.keyboard_double_arrow_right),
      ),
    );
  }
}