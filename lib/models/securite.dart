import 'package:diagoto/models/controle_securite/carrosserie.dart';
import 'package:diagoto/models/controle_securite/freins.dart';
import 'package:diagoto/models/controle_securite/phares_signalisation.dart';
import 'package:diagoto/models/controle_securite/suspension_direction.dart';
import 'package:diagoto/models/controle_securite/pneus.dart';

class Securite {
  final Carrosserie carrosserie; // état de la carrosserie
  final Freins freins; // état des freins
  final PharesSignalisation pharesSignalisation; // état des phares et signalisation
  final Pneus pneus; // état des pneus
  final SuspensionDirection suspensionDirection; // état de la suspension et direction
  
  Securite({
    required this.carrosserie,
    required this.freins,
    required this.pharesSignalisation,
    required this.pneus,
    required this.suspensionDirection,
  });

  Map<String, dynamic> toJson() => {
    'carrosserie': carrosserie.toJson(),
    'freins': freins.toJson(),
    'pharesSignalisation': pharesSignalisation.toJson(),
    'pneus': pneus.toJson(),
    'suspensionDirection': suspensionDirection.toJson(),
  };

  factory Securite.fromJson(Map<String, dynamic> json) {
    return Securite(
      carrosserie: Carrosserie.fromJson(json['carrosserie'] as Map<String, dynamic>),
      freins: Freins.fromJson(json['freins'] as Map<String, dynamic>),
      pharesSignalisation: PharesSignalisation.fromJson(json['pharesSignalisation'] as Map<String, dynamic>),
      pneus: Pneus.fromJson(json['pneus'] as Map<String, dynamic>),
      suspensionDirection: SuspensionDirection.fromJson(json['suspensionDirection'] as Map<String, dynamic>),
    );
  }
}