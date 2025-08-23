class Freins {
  final bool? disquesFreins; // état des disques de frein
  final bool? tamboursFreins; // état des tambours de frein
  final bool? garnituresFreins; // état des garnitures de frein
  final bool? freinMain; // état du frein à main

  Freins({
    this.disquesFreins,
    this.tamboursFreins,
    this.garnituresFreins,
    this.freinMain,
  });

  Map<String, dynamic> toJson() => {
    'disquesFreins': disquesFreins,
    'tamboursFreins': tamboursFreins,
    'garnituresFreins': garnituresFreins,
    'freinMain': freinMain,
  };

  factory Freins.fromJson(Map<String, dynamic> json) {
    return Freins(
      disquesFreins: json['disquesFreins'] as bool?,
      tamboursFreins: json['tamboursFreins'] as bool?,
      garnituresFreins: json['garnituresFreins'] as bool?,
      freinMain: json['freinMain'] as bool?,
    );
  }
}