class Carrosserie {
  String? etatGeneral; // état général de la carrosserie
  String? boucliers; // état des boucliers

  Carrosserie({this.etatGeneral, this.boucliers});

  Map<String, dynamic> toJson() {
    return {
      'etatGeneral': etatGeneral,
      'boucliers': boucliers,
    };
  }

  factory Carrosserie.fromJson(Map<String, dynamic> json) {
    return Carrosserie(
      etatGeneral: json['etatGeneral'] as String?,
      boucliers: json['boucliers'] as String?,
    );
  }
}