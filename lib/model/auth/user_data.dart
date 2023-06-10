class UserDataModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  String get name => '$firstName $lastName';

  UserDataModel({this.email, this.firstName, this.lastName, this.password});
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password_confirmation': password,
    };
  }

  factory UserDataModel.fromJson(Map<String, dynamic> map) {
    return UserDataModel(
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }
}
