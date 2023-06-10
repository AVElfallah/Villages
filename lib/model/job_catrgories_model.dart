class JobCategoriesModel {
  final int? id;

  final String? name;
  final String? photo;

  JobCategoriesModel({
    this.id,
    this.name,
    this.photo,
  });

  factory JobCategoriesModel.fromJson(Map<String, dynamic> json) {
    return JobCategoriesModel(
      id: json['id'],
      name: json['attributes']['name'],
      photo: json['attributes']['photo'],
    );
  }
}
