import 'package:villages/model/doctors/hospital_doctor_date.dart';

class HDoctor {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? clinicId;
  int? userId;
  String? name;
  String? photo;
  String? clinicName;
  String? place;
  double? rateCount;
  double? rate;
  List<HospitalDoctorDate>? hospitalDoctorDates;

  double get rateAvg => rate! / rateCount!;
  HDoctor({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.clinicId,
    this.userId,
    this.name,
    this.photo,
    this.clinicName,
    this.place,
    this.rateCount,
    this.rate,
    this.hospitalDoctorDates,
  });

  factory HDoctor.fromJson(Map<String, dynamic> json) {
    var list = json['hospitaldoctoredates'] as List;

    return HDoctor(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      clinicId: json['clinic_id'],
      userId: json['user_id'],
      name: json['name'],
      photo: json['photo'],
      clinicName: json['clinic_name'],
      place: json['place'],
      rateCount: json['rate_count'].toDouble(),
      rate: json['rate'].toDouble(),
      hospitalDoctorDates:
          list.map((item) => HospitalDoctorDate.fromJson(item)).toList(),
    );
  }

  toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'clinic_id': clinicId,
      'user_id': userId,
      'name': name,
      'photo': photo,
      'clinic_name': clinicName,
      'place': place,
      'rate_count': rateCount,
      'rate': rate,
      'hospitaldoctoredates': hospitalDoctorDates,
    };
  }
}
