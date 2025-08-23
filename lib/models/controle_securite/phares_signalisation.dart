class PharesSignalisation {
  final bool? phares; // état des phares 
  final bool? essuieGlaces; // état des essuie-glaces

  PharesSignalisation({
    this.phares,
    this.essuieGlaces,
  });

  Map<String, dynamic> toJson() => {
    'phares': phares,
    'essuieGlaces': essuieGlaces,
  };

  factory PharesSignalisation.fromJson(Map<String, dynamic> json) {
    return PharesSignalisation(
      phares: json['phares'] as bool?,
      essuieGlaces: json['essuieGlaces'] as bool?,
    );
  }
}