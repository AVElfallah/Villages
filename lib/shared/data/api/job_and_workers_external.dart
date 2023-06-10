import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:villages/shared/data/Client/user_auth.dart';

import '../../../model/job_catrgories_model.dart';
import '../../../model/workers.dart';
import '../../constants/constant.dart';

class JobAndWorkersExternal {
  JobAndWorkersExternal._();
  static final JobAndWorkersExternal instance = JobAndWorkersExternal._();
  static JobAndWorkersExternal get i => instance;

  String get tok => UserAuth.i.token;

  Future<List<JobCategoriesModel>> fetchJobCategories() async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: jobCategoriesAPI,
        ),
      ).get('');
      var data = (res).data['data'] as List;
      var jobCategories =
          data.map((e) => JobCategoriesModel.fromJson(e)).toList();
      return jobCategories;
    } catch (e) {
      return [];
    }
  }

  Future<List<WorkerModel>> fetchWorkers(int id) async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: workersAPI,
        ),
      ).get('/$id');
      var data = (res).data['data'] as List;
      var workers = data.map((e) => WorkerModel.fromJson(e)).toList();
      return workers;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  /* Future<bool> rateAWorker(int id, double rate) async {
    try {
      var res = await Dio(
        BaseOptions(baseUrl: rateWorkerAPI(id, rate), headers: {
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
  } */
}
