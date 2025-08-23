class SuspensionDirection {
  final String? suspension; // état de la suspension
  final String? trainsRoulants; // état des trains roulants

  SuspensionDirection({
    this.suspension,
    this.trainsRoulants,
  });

  Map<String, dynamic> toJson() => {
    'suspension': suspension,
    'trainsRoulants': trainsRoulants,
  };

  factory SuspensionDirection.fromJson(Map<String, dynamic> json) {
    return SuspensionDirection(
      suspension: json['suspension'] as String?,
      trainsRoulants: json['trainsRoulants'] as String?,
    );
  }
}