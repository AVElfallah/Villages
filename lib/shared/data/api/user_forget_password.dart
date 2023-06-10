import 'package:dio/dio.dart';

import '../../constants/constant.dart';

class UserForgetPassword {
  UserForgetPassword._();
  static final UserForgetPassword _instance = UserForgetPassword._();
  static UserForgetPassword get i => _instance;

//SECTION - Forget Password method request a new password
//NOTE - This method is used to request a new password and return a message to the user
  Future<List> forgetPassword(String email) async {
    try {
      var res = await Dio(BaseOptions(
        headers: {
          'Accept': 'application/json',
        },
        baseUrl: forgetPasswordAPI,
      )).post('', queryParameters: {
        'email': email,
      });
      if (res.data['success'] == null) {
        return [res.data['message'], false];
      }
      return [res.data['message'], true];
    } catch (e) {
      return ['Error ::$e', false];
    }
  }

  //SECTION -  Reset Password method request a new password
//NOTE - This method is used to request a new password and return a message to the user
  Future<List> resetPassword(String email, String password, String otp) async {
    try {
      var res = await Dio(BaseOptions(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        baseUrl: resetPasswordAPI,
      )).post('', queryParameters: {
        'email': email,
        'password': password,
        'otp': otp,
      });
      if (res.data['success'] == null) {
        return [res.data['message'], false];
      }

      return ['password has been changed', true];
    } catch (e) {
      return ['Error ::$e', false];
    }
  }

  //SECTION - Check OTP method to check if the OTP is valid
  Future<bool> checkOtp(String email, String otp) async {
    try {
      var res = await Dio(BaseOptions(
        headers: {
          'Accept': 'application/json',
        },
        baseUrl: checkOtpAPI,
      )).get('', queryParameters: {
        'email': email,
        'otp': otp,
      });

      return res.data['valid'];
    } catch (e) {
      return false;
    }
  }
}
