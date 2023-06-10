import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:villages/shared/data/Client/user_auth.dart';

import '../../constants/constant.dart';

class ProfileExternalSettings {
  ProfileExternalSettings._();
  static final ProfileExternalSettings _instance = ProfileExternalSettings._();
  static ProfileExternalSettings get i => _instance;

  String get tok => UserAuth.i.token;
  Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${UserAuth.i.token}',
  };

  //SECTION -  change password method
  Future<bool> changePassword(
      String currentPassword, String newPassword) async {
    try {
      var res = await Dio(BaseOptions(
        headers: headers,
        baseUrl: changePasswordAPI,
      )).post('', queryParameters: {
        'current_password': currentPassword,
        'new_password': newPassword,
      });
      if (res.data['done'] == false) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //SECTION -  change phone number
  Future<bool> changePhone(String? phone) async {
    try {
      var res = await Dio(BaseOptions(
        headers: headers,
        baseUrl: changePhoneAPI,
      )).post('', queryParameters: {
        'phone_number': phone,
      });
      if (res.data['done'] == false) {
        return false;
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
