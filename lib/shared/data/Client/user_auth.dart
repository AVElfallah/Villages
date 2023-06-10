import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:villages/model/auth/user.dart';

import '../../constants/constant.dart';

class UserAuth {
  UserAuth._() {
    loadUser().then(
      (value) {
        if (value) {
          debugPrint('User Authenticated');
          debugPrint(toString());
        } else {
          _token = '';
          _name = '';
          _email = '';
          _phone = '';
          _id = '';
          debugPrint(toString());
          debugPrint('User Not Authenticated');
        }
      },
    );
  }
  static final UserAuth _instance = UserAuth._();
  static UserAuth get i => _instance;

  late String? _token;
  late String? _name;
  late String? _email;
  late String? _phone;
  late String? _id;
  final GetStorage _storage = GetStorage(
    authContainerTag,
  );
  String get token => _token ?? '';
  String get name => _name ?? '';
  String get email => _email ?? '';
  String get phone => _phone ?? '';
  String get id => _id ?? '';

  void setNumber(String number) async {
    _phone = number;
    await _storage.write('phone', number);
    await _storage.save();
    await loadUser();
  }

  Future<bool> saveUser(UserModel user) async {
    try {
      _token = token;
      await _storage.write('Token', user.token);
      await _storage.write('name', user.name);
      await _storage.write('email', user.email);
      await _storage.write('phone', user.phone);
      await _storage.write('id', user.id);
      await _storage.save();
      await loadUser();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> resetUser() async {
    await _storage.erase();
    await _storage.save();
    _token = '';
    _name = '';
    _email = '';
    _phone = '';
    _id = '';

    await loadUser();
  }

  Future<bool> loadUser() async {
    try {
      _token = _storage.read<String>('Token')!;
      _name = _storage.read<String>('name')!;
      _email = _storage.read<String>('email')!;
      _phone = _storage.read<String>('phone')!;
      _id = _storage.read<String>('id')!;
      if (_token == null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  String toString() {
    return 'UserAuth: {token: $_token, name: $_name, email: $_email, phone: $_phone, id: $_id}';
  }
}
