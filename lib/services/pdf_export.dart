import 'dart:io';
import 'package:diagoto/models/diagnostic.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class PdfExport {
  Future<File> generatePdf(Diagnostic diagnostic) async {
    final pdf = pw.Document();

    // Charger un logo depuis assets
    // final logoData = await rootBundle.load('assets/logo.png');
    // final logoImage = pw.MemoryImage(logoData.buffer.asUint8List());

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          // Logo + titre
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              // pw.Image(logoImage, width: 60),
              pw.Text(
                diagnostic.automobile.immatriculation,
                style: pw.TextStyle(
                  fontSize: 28,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 20),

          // Tableau des exercices
          pw.ListView(
            children: [
              pw.Text(
                "Informations sur le véhicule",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text("Marque: ${diagnostic.automobile.marque}"),
              pw.Text("Modèle: ${diagnostic.automobile.modele}"),
              pw.Text("Kilométrage: ${diagnostic.automobile.kilometrage} km"),
              pw.Text("Type de carburant: ${diagnostic.automobile.typeCarburant}"),
              pw.SizedBox(height: 20),
              pw.Text(
                "Contrôle Essentiels Sécurité",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text("Carrosserie - État général: ${diagnostic.securite.carrosserie.etatGeneral}"),
              pw.Text("Carrosserie - Boucliers: ${diagnostic.securite.carrosserie.boucliers}"),
              pw.Text("Pneus - Usure avant: ${diagnostic.securite.pneus.usurePneusAvant}"),
              pw.Text("Pneus - Usure arrière: ${diagnostic.securite.pneus.usurePneusArriere}"),
              pw.Text("Pneus - Pression correcte: ${diagnostic.securite.pneus.pressionPneus == true ? 'Oui' : 'Non'}"),
              pw.Text("Pneus - Alignement correct: ${diagnostic.securite.pneus.alignementPneus == true ? 'Oui' : 'Non'}"),
              // Ajouter d'autres sections similaires pour les autres parties du diagnostic
            ],
          ),
        ],
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final pdfDir = Directory("${dir.path}/DiagnosticsPDF");
    if (!await pdfDir.exists()) {
      await pdfDir.create(recursive: true);
    }
    final file = File("${pdfDir.path}/${diagnostic.automobile.immatriculation}.pdf");
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}