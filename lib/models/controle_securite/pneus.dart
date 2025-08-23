class Pneus {
  final String? usurePneusAvant; // état des pneus avant
  final String? usurePneusArriere; // état des pneus arrière
  final bool? pressionPneus; // pression des pneus
  final bool? alignementPneus; // alignement des pneus

  Pneus({
    this.usurePneusAvant,
    this.usurePneusArriere,
    this.pressionPneus,
    this.alignementPneus,
  });

  Map<String, dynamic> toJson() => {
    'usurePneusAvant': usurePneusAvant,
    'usurePneusArriere': usurePneusArriere,
    'pressionPneus': pressionPneus,
    'alignementPneus': alignementPneus,
  };

  factory Pneus.fromJson(Map<String, dynamic> json) {
    return Pneus(
      usurePneusAvant: json['usurePneusAvant'] as String?,
      usurePneusArriere: json['usurePneusArriere'] as String?,
      pressionPneus: json['pressionPneus'] as bool?,
      alignementPneus: json['alignementPneus'] as bool?,
    );
  }
}