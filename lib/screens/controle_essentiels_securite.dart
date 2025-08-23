import 'package:diagoto/models/controle_securite/carrosserie.dart';
import 'package:diagoto/models/controle_securite/pneus.dart';
import 'package:diagoto/screens/optimiser_performances.dart';
import 'package:diagoto/services/json_storage.dart';
import 'package:flutter/material.dart';

class ControleEssentielsSecurite extends StatefulWidget {
  const ControleEssentielsSecurite({super.key});

  @override
  State<ControleEssentielsSecurite> createState() => _ControleEssentielsSecuriteState();
}

class _ControleEssentielsSecuriteState extends State<ControleEssentielsSecurite> {
  final storage = JsonStorage();
  final _formKey = GlobalKey<FormState>();
  String? _etatGeneral;
  String? _boucliers;
  String? _usurePneusAvant;
  String? _usurePneusArriere;
  bool? _pressionPneus;
  bool? _alignementPneus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les points de contrôle essentiels pour la sécurité'),
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
                  "Carrosserie",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'État général', 
                  helperText: "Inspectez la carrosserie pour repérer d’éventuelles corrosions ou dommages qui pourraient affecter la sécurité.",
                  ),
                onSaved: (value) => _etatGeneral = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Boucliers',
                  helperText: "Vérifiez qu’ils sont bien fixés et en bon état.",
                  ),
                onSaved: (value) => _boucliers = value,
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Pneus",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Pneus avant', 
                  helperText: "Inspectez la profondeur des sculptures pour s’assurer qu’elles respectent les normes légales.",
                  ),
                onSaved: (value) => _usurePneusAvant = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Pneus arrière', 
                  helperText: "Inspectez la profondeur des sculptures pour s’assurer qu’elles respectent les normes légales.",
                  ),
                onSaved: (value) => _usurePneusArriere = value,
              ),
              DropdownButtonFormField<bool>(
                decoration: const InputDecoration(labelText: 'Pression des pneus', 
                  helperText: "Vérifiez la pression des pneus à froid et ajustez-la selon les recommandations du fabricant.",
                  ),
                items: const [
                  DropdownMenuItem(value: true, child: Text('Effectuée')),
                  DropdownMenuItem(value: false, child: Text('Non effectuée')),
                ],
                onChanged: (value) {
                  setState(() {
                  _pressionPneus = value;
                  });
                },
                onSaved: (value) => _pressionPneus = value,
                value: _pressionPneus,
              ),
              DropdownButtonFormField<bool>(
                decoration: const InputDecoration(labelText: 'Alignement des pneus', 
                  helperText: "Vérifiez l’alignement des pneus pour assurer une conduite stable et sécurisée.",
                  ),
                items: const [
                  DropdownMenuItem(value: true, child: Text('Effectuée')),
                  DropdownMenuItem(value: false, child: Text('Non effectuée')),
                ],
                onChanged: (value) {
                  setState(() {
                  _alignementPneus = value;
                  });
                },
                onSaved: (value) => _alignementPneus = value,
                value: _alignementPneus,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Carrosserie carrosserie = Carrosserie(
              etatGeneral: _etatGeneral,
              boucliers: _boucliers,
            );
            Pneus pneus = Pneus(
              usurePneusAvant: _usurePneusAvant,
              usurePneusArriere: _usurePneusArriere,
              pressionPneus: _pressionPneus,
              alignementPneus: _alignementPneus,
            );
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OptimiserPerformances()),
            );
          }
        },
        child: const Icon(Icons.keyboard_double_arrow_right),
      ),
    );
  }
}