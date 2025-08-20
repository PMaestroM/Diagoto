class Automobile {
  final String immatriculation; // immatriculation de l'automobile
  final String marque; // marque de l'automobile
  final String modele; // modèle de l'automobile
  final String kilometrage; // kilométrage de l'automobile
  final String typeCarburant; // type de carburant de l'automobile

  Automobile({required this.immatriculation, required this.marque, required this.modele, required this.kilometrage, required this.typeCarburant});

  Map<String, dynamic> toJson() => {
    'immatriculation': immatriculation,
    'marque': marque,
    'modele': modele,
    'kilometrage': kilometrage,
    'typeCarburant': typeCarburant,
  };

  factory Automobile.fromJson(Map<String, dynamic> json) {
    return Automobile(
      immatriculation: json['immatriculation'] as String,
      marque: json['marque'] as String,
      modele: json['modele'] as String,
      kilometrage: json['kilometrage'] as String,
      typeCarburant: json['typeCarburant'] as String,
    );
  }
}