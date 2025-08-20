import 'package:diagoto/models/automobile.dart';

class Diagnostic {
  final DateTime date; // date du diagnostic
  final Automobile automobile; // automobile concernée par le diagnostic

  Diagnostic({required this.date, required this.automobile});

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'automobile': automobile.toJson(),
  };

  factory Diagnostic.fromJson(Map<String, dynamic> json) {
    return Diagnostic(
      date: DateTime.parse(json['date'] as String),
      automobile: Automobile.fromJson(json['automobile'] as Map<String, dynamic>),
    );
  }
}