class MoteurHuile {
  final String? moteur; // état du moteur
  final String? huile; // état de l'huile

  MoteurHuile({
    this.moteur,
    this.huile,
  });

  Map<String, dynamic> toJson() => {
    'moteur': moteur,
    'huile': huile,
  };
}