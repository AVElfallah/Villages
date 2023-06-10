import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:villages/model/club_model.dart';

import '../../constants/constant.dart';

class ClubExternal {
  ClubExternal._();
  static final ClubExternal _instance = ClubExternal._();
  static ClubExternal get i => _instance;

  Future<List<ClubModel>> fetchClubs() async {
    try {
      Dio dio = Dio(
        BaseOptions(
          baseUrl: clubAPI,
        ),
      );
      var res = await dio.get('');
      var data = (res).data['data'] as List;

      var clubs = data.map((e) => ClubModel.fromJson(e)).toList();
      return clubs;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('stop');
      return [];
    }
  }
}
