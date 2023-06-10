import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:villages/model/doctors/doctor_clinc.dart';

import '../../../constants/constant.dart';

class PrivateClincExternal {
  static PrivateClincExternal? _instance;

  PrivateClincExternal._();

  static PrivateClincExternal get instance {
    _instance ??= PrivateClincExternal._();

    return _instance!;
  }

  Future<List<DoctorClinic>> getAllDoctorsFromClinc() async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: getAllDoctorsInPraviteClinicAPI,
        ),
      ).get('');
      var data = (res).data['doctors'] as List;
      var doctors = data.map((e) => DoctorClinic.fromJson(e)).toList();
      return doctors;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
