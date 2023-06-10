import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:villages/model/auth/user.dart';
import 'package:villages/model/auth/user_data.dart';

import '../../constants/constant.dart';

class UserAuthExternal {
  UserAuthExternal._();
  static final UserAuthExternal _i = UserAuthExternal._();
  static UserAuthExternal get i => _i;

//SECTION -  Login Method for the user to make a login request
//NOTE - after the login request is made the user is authenticated and the token is stored in the local storage
//NOTE - the token is stored in the local storage using the get_storage package
//NOTE - for programing purposes we don't directly store the token in the local storage we use a controller to store the token
  Future<UserModel?> login(String email, String password) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: loginAPI,
        ),
      ).post(
        '',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(headers: headers),
      );
      debugPrint(res.data.toString());
      //SECTION - return null if the login request is not successful
      if (res.data["success"] == null) {
        return null;
      }
      return UserModel.fromJson(res.data);
    } catch (e) {
      //SECTION - return null if the login request is not successful
      return null;
    }
  }

  //SECTION - Singup Method for the user to make a signup request

  Future<UserModel?> signup(UserDataModel signupModel) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: registerAPI,
        ),
      ).post(
        '',
        queryParameters: signupModel.toJson(),
        options: Options(headers: headers),
      );
      //SECTION - return null if the signup request is not successful
      if (res.data["success"] == null) {
        return null;
      }
      return UserModel.fromJson(res.data);
    } catch (e) {
      //SECTION - return null if the signup request is not successful
      return null;
    }
  }
}
