class TeacherModel {
  final int? id;
  final int? schoolId;
  final int? userId;
  final String? name;
  final String? photo;
  final String? subject;
  final String? stage;
  final String? email;
  final String? phone;
  final String? address;
  final double? rateCount;
  final double? rate;

  double rateAvge() {
    var d = (rate! / rateCount!).isNaN
        ? 0.toDouble()
        : (rate! / rateCount!).toDouble();
    return d;
  }

  TeacherModel({
    this.id,
    this.schoolId,
    this.userId,
    this.name,
    this.photo,
    this.subject,
    this.stage,
    this.email,
    this.phone,
    this.address,
    this.rateCount,
    this.rate,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] as Map<String, dynamic>;
    return TeacherModel(
      id: json['id'] as int,
      schoolId: json['school_id'] as int,
      userId: json['user_id'] as int,
      name: attributes['name'] as String,
      photo: attributes['photo'] as String,
      subject: attributes['subject'] as String,
      stage: attributes['stage'] as String,
      email: attributes['email'] as String?,
      phone: attributes['phone'] as String? ?? 'لا يوجد',
      address: attributes['address'] as String? ?? 'العنوان غير متوفر',
      rateCount: attributes['rate_count'].toDouble(),
      rate: attributes['rate'].toDouble(),
    );
  }
}
