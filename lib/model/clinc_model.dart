class ClinicModel {
  final int id;
  final String name;
  final String photo;

  ClinicModel({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
      id: json['id'] as int,
      name: json['attributes']['name'] as String,
      photo: json['attributes']['photo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'attributes': {
        'name': name,
        'photo': photo,
      },
    };
  }
}
