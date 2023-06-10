class ClubModel {
  final String? name;
  final String? image;
  final String? id;

  ClubModel({this.name, this.image, this.id});

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
      name: json['name'],
      image: json['photo'],
      id: json['id'].toString(),
    );
  }

  toJson() {
    return {
      'name': name,
      'photo': image,
      'id': id,
    };
  }
}
