class DoctorClinic {
  int? id;
  int? userId;
  String? name;
  String? photo;
  String? field;
  String? price;
  double? rateCount;
  double? rate;
  String? createdAt;
  String? updatedAt;
  List<DoctorDate>? doctorDates;

  double getRate() {
    var d = (rate! / rateCount!).isNaN
        ? 0.toDouble()
        : (rate! / rateCount!).toDouble();
    return d;
  }

  DoctorClinic({
    this.id,
    this.userId,
    this.name,
    this.photo,
    this.field,
    this.price,
    this.rateCount,
    this.rate,
    this.createdAt,
    this.updatedAt,
    this.doctorDates,
  });

  factory DoctorClinic.fromJson(Map<String, dynamic> json) {
    var list = json['doctordates'] as List;

    return DoctorClinic(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      photo: json['photo'],
      field: json['field'],
      price: json['price'],
      rateCount: json['rate_count'].toDouble(),
      rate: json['rate'].toDouble(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      doctorDates: list.map((item) => DoctorDate.fromJson(item)).toList(),
    );
  }
}

class DoctorDate {
  int? id;
  int? doctorClinicId;
  String? day;
  String? time;
  int? off;
  String? createdAt;
  String? updatedAt;

  DoctorDate({
    this.id,
    this.doctorClinicId,
    this.day,
    this.time,
    this.off,
    this.createdAt,
    this.updatedAt,
  });

  factory DoctorDate.fromJson(Map<String, dynamic> json) {
    return DoctorDate(
      id: json['id'],
      doctorClinicId: json['doctorclinic_id'],
      day: json['day'],
      time: json['time'],
      off: json['off'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
