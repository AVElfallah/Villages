class VillageModel {
  int? id;
  String? name;
  String? location;
  String? area;

  VillageModel({
    this.id,
    this.name,
    this.location,
    this.area,
  });

  factory VillageModel.fromJson(Map<String, dynamic> json) {
    return VillageModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      area: json['area'],
    );
  }
}
