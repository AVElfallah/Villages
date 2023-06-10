import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Client/user_auth.dart';

class RateAWorkerExternal {
  RateAWorkerExternal._();
  static final RateAWorkerExternal _instance = RateAWorkerExternal._();
  static RateAWorkerExternal get i => _instance;
  String get tok => UserAuth.i.token;

  Future<bool> rateAWorker(String api) async {
    try {
      var res = await Dio(
        BaseOptions(baseUrl: api, headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tok',
        }),
      ).post('');
      if (res.statusCode != 200) {
        return false;
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
