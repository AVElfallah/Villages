class SchoolModel {
  final int? id;
  final String? name;
  final String? photo;

  SchoolModel({
    this.id,
    this.name,
    this.photo,
  });

  factory SchoolModel.fromJson(Map json) {
    return SchoolModel(
      id: json['id'],
      name: json['attributes']['name'],
      photo: json['attributes']['photo'],
    );
  }
}
