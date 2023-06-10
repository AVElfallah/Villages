import 'package:dio/dio.dart';
import 'package:villages/model/clinc_model.dart';
import 'package:villages/model/doctors/h_doctor.dart';
import 'package:villages/shared/constants/constant.dart';

class HospitalClincExternal {
  static HospitalClincExternal? _instance;

  HospitalClincExternal._();

  static HospitalClincExternal get instance {
    _instance ??= HospitalClincExternal._();

    return _instance!;
  }

  Future<List<ClinicModel>> fetchClinics() async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: getAllHospitalClincAPI,
        ),
      ).get('');
      var data = (res).data['data'] as List;
      var clinics = data.map((e) => ClinicModel.fromJson(e)).toList();
      return clinics;
    } catch (e) {
      return [];
    }
  }

  Future<List<HDoctor>> fetchClincDoctorsByID(int clincID) async {
    try {
      var doctorsINClincHospitalAPI = getDoctorsINClincHospitalAPI(clincID);
      var res = await Dio(
        BaseOptions(
          baseUrl: doctorsINClincHospitalAPI,
        ),
      ).get('');
      var data = (res).data['doctors'] as List;
      var doctors = data.map((e) => HDoctor.fromJson(e)).toList();
      return doctors;
    } catch (e) {
      return [];
    }
  }
}
