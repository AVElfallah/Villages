class UserModel {
  final String? token;
  final String? name;
  final String? email;
  final String? phone;
  final String? id;

  UserModel({
    this.token,
    this.name,
    this.email,
    this.phone,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['Token'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'Token': token,
        'name': name,
        'email': email,
        'phone': phone,
        'id': id,
      };

  UserModel copyWith({
    String? token,
    String? name,
    String? email,
    String? phone,
    String? id,
  }) {
    return UserModel(
      token: token ?? this.token,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      id: id ?? this.id,
    );
  }
}
