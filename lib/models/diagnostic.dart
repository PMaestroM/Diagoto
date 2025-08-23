import 'package:diagoto/models/automobile.dart';
import 'package:diagoto/models/securite.dart';

class Diagnostic {
  final DateTime date; // date du diagnostic
  final Automobile automobile; // automobile concernée par le diagnostic
  Securite securite; // contrôles de sécurité

  Diagnostic(
    {required this.date, required this.automobile, required this.securite});

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'automobile': automobile.toJson(),
    'securite': securite.toJson(),
  };

  factory Diagnostic.fromJson(Map<String, dynamic> json) {
    return Diagnostic(
      date: DateTime.parse(json['date'] as String),
      automobile: Automobile.fromJson(json['automobile'] as Map<String, dynamic>),
      securite: Securite.fromJson(json['securite'] as Map<String, dynamic>),
    );
  }
}