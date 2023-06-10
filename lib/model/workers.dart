class WorkerModel {
  final int? id;
  final int? worksId;
  final int? userId;
  final String? name;
  final String? photo;
  final String? jobName;
  final String? address;
  final String? email;
  final String? phone;
  final String? workTime;
  final double? rateCount;
  final double? rate;
  final double? rateAvg;

  WorkerModel({
    this.id,
    this.worksId,
    this.userId,
    this.name,
    this.photo,
    this.jobName,
    this.address,
    this.email,
    this.phone,
    this.workTime,
    this.rateCount,
    this.rate,
    this.rateAvg,
  });

  factory WorkerModel.fromJson(Map<String, dynamic> json) {
    return WorkerModel(
      id: json['id'],
      worksId: json['works_id'],
      userId: json['user_id'],
      name: json['attributes']['name'],
      photo: json['attributes']['photo'],
      jobName: json['attributes']['jobname'],
      address: json['attributes']['address'],
      email: json['attributes']['email'],
      phone: json['attributes']['phone'],
      workTime: json['attributes']['worktime'],
      rateCount: json['attributes']['rate_count'].toDouble(),
      rate: json['attributes']['rate'].toDouble(),
    );
  }
}
