import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:villages/model/teacher.dart';
import 'package:villages/shared/constants/constant.dart';

import '../../../model/school_model.dart';

class SchoolExternal {
  SchoolExternal._();
  static final SchoolExternal _instance = SchoolExternal._();
  static SchoolExternal get i => _instance;

  Future<List<SchoolModel>> getSchools() async {
    try {
      var res = await Dio(BaseOptions(
        baseUrl: getAllSchoolsAPI,
      )).get('');
      var data = (res).data['data'] as List;
      return data.map((e) => SchoolModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<TeacherModel>> getTeacherBySchool(String schoolID) async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: '$fetchSchoolTeachersAPI/$schoolID',
        ),
      ).get(
        '',
      );
      var data = (res).data['data'] as List;
      var teachers = data.map((e) => TeacherModel.fromJson(e)).toList();
      return teachers;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
