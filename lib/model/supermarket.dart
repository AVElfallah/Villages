class SupermarketModel {
  final int? id;
  final String? name;
  final String? photo;
  final String? location;
  final double? rate;
  final double? rateCount;
  final double? rateAvg;

  SupermarketModel({
    this.id,
    this.name,
    this.photo,
    this.location,
    this.rate,
    this.rateCount,
    this.rateAvg,
  });

  factory SupermarketModel.fromJson(Map<String, dynamic> json) {
    final rate = json['attributes']['rate'].toDouble();
    final rateCount = json['attributes']['rate_count'].toDouble();
    final rateAvg =
        rateCount == 0 ? 0.0 : rate.toDouble() / rateCount.toDouble();

    return SupermarketModel(
      id: json['id'],
      name: json['attributes']['name'],
      photo: json['attributes']['photo'],
      location: json['attributes']['location'],
      rate: rate,
      rateCount: rateCount,
      rateAvg: rateAvg,
    );
  }
}
