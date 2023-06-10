class TopRated {
  int? id;
  String? photo;
  String? name;
  double? rateCount;
  double? rate;
  String? type;

  double get rateAvge {
    var stringAsFixed = rate! / rateCount!;
    var d = (stringAsFixed).isNaN ? 0.toDouble() : stringAsFixed;
    return d;
  }

  TopRated(
      {this.id, this.photo, this.name, this.rateCount, this.rate, this.type});

  factory TopRated.fromJson(Map<String, dynamic> json) {
    return TopRated(
      id: json['id'],
      photo: json['photo'],
      name: json['name'],
      type: json['type'],
      rateCount: json['rate_count'].toDouble(),
      rate: json['rate'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['name'] = name;
    data['type'] = type;
    data['rate_count'] = rateCount;
    data['rate'] = rate;
    return data;
  }
}
