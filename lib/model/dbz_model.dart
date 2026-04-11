class DbzModel {
  final int id;
  final String name;
  final String ki;
  final String maxKi;
  final String race;
  final String gender;
  final String description;
  final String image;
  final String affiliation;

  DbzModel({
    required this.id,
    required this.name,
    required this.ki,
    required this.maxKi,
    required this.race,
    required this.gender,
    required this.description,
    required this.image,
    required this.affiliation,
  });

  factory DbzModel.fromJson(Map<String, dynamic> json) {
    return DbzModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      ki: json['ki']?.toString() ?? '',
      maxKi: json['maxKi']?.toString() ?? json['max_ki']?.toString() ?? '',
      race: json['race'] ?? '',
      gender: json['gender'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      affiliation: json['affiliation'] ?? '',
    );
  }
}
