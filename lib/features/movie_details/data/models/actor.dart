class Actor {
  final int id;
  final String name;
  final String originalName;
  final String character;
  final String? profilePath;
  final int gender;
  final double popularity;
  final String knownForDepartment;

  Actor({
    required this.id,
    required this.name,
    required this.originalName,
    required this.character,
    this.profilePath,
    required this.gender,
    required this.popularity,
    required this.knownForDepartment,
  });

  // Factory constructor to parse JSON data
  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['id'],
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      character: json['character'] ?? '',
      profilePath: json['profile_path'],
      gender: json['gender'] ?? 0,
      popularity: (json['popularity'] as num).toDouble(),
      knownForDepartment: json['known_for_department'] ?? '',
    );
  }

  // Convert Actor object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'original_name': originalName,
      'character': character,
      'profile_path': profilePath,
      'gender': gender,
      'popularity': popularity,
      'known_for_department': knownForDepartment,
    };
  }
}
