class HospitalDoctorDate {
  int? id;
  int? hospitalDoctorId;
  String? day;
  String? time;
  int? off;
  dynamic createdAt;
  dynamic updatedAt;

  HospitalDoctorDate({
    this.id,
    this.hospitalDoctorId,
    this.day,
    this.time,
    this.off,
    this.createdAt,
    this.updatedAt,
  });

  factory HospitalDoctorDate.fromJson(Map<String, dynamic> json) {
    return HospitalDoctorDate(
      id: json['id'],
      hospitalDoctorId: json['hospitaldoctor_id'],
      day: json['day'],
      time: json['time'],
      off: json['off'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  toJson() {
    return {
      'id': id,
      'hospitaldoctor_id': hospitalDoctorId,
      'day': day,
      'time': time,
      'off': off,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
