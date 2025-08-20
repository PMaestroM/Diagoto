import 'dart:convert';
import 'dart:io';
import 'package:diagoto/models/diagnostic.dart';
import 'package:path_provider/path_provider.dart';

class JsonStorage {
  Future<Directory> _getDiagnosticDir() async {
    final dir = await getApplicationDocumentsDirectory();
    final diagDir = Directory("${dir.path}/Diagnostics");
    if (!await diagDir.exists()) {
      await diagDir.create(recursive: true);
    }
    return diagDir;
  }

  Future<void> saveDiagnostic(Diagnostic diagnostic) async {
    final dir = await _getDiagnosticDir();
    final file = File("${dir.path}/${diagnostic.automobile.immatriculation}.json");
    await file.writeAsString(jsonEncode(diagnostic.toJson()));
  }

  Future<void> deleteDiagnostic(String immatriculation) async {
    final dir = await _getDiagnosticDir();
    final file = File("${dir.path}/$immatriculation.json");
    if (await file.exists()) {
      await file.delete();
    }
  }
}