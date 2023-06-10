class ServiceModel {
  int? id;
  int? villageId;
  String? name;
  String? photo;

  ServiceModel({
    this.id,
    this.villageId,
    this.name,
    this.photo,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      villageId: json['village_id'],
      name: json['attributes']['name'],
      photo: json['attributes']['photo'],
    );
  }
}
