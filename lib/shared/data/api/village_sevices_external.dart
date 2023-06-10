import 'package:dio/dio.dart';
import 'package:villages/model/doctors/h_doctor.dart';
import 'package:villages/model/supermarket.dart';
import 'package:villages/model/teacher.dart';
import 'package:villages/model/village_model.dart';
import 'package:villages/model/workers.dart';
import 'package:villages/shared/views/components/hospital_doctor_card.dart';

import '../../../model/doctors/doctor_clinc.dart';
import '../../../model/service_model.dart';
import '../../../model/top_rated_model.dart';
import '../../constants/constant.dart';

class VillageSevicesExternal {
  VillageSevicesExternal._();
  static final VillageSevicesExternal _instance = VillageSevicesExternal._();
  static VillageSevicesExternal get i => _instance;

  //SECTION -  fetch village services
  Future<List<ServiceModel>> fetchVillageServices() async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: fetchServicesAPI,
        ),
      ).get('vellage_id=1');
      var data = (res).data['data'] as List;
      var villageServices = data
          .map((e) => ServiceModel.fromJson(
                e,
              ))
          .toList();
      return villageServices;
    } catch (e) {
      return [];
    }
  }

  //SECTION - fetch villages
  Future<List<VillageModel>> fetchVillages() async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: fetchVillageAPI,
        ),
      ).get('');
      var data = (res).data['data'] as List;
      var villages = data
          .map((e) => VillageModel.fromJson(
                e,
              ))
          .toList();
      return villages;
    } catch (e) {
      return [];
    }
  }

  Future<List<TopRated>> getTopRatedVillages() async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: getTheTopRatedServicesAPI,
        ),
      ).get('');

      var topRated = (res).data['data'] as List;
      var backTopRated = topRated
          .map((e) => TopRated.fromJson(
                e,
              ))
          .toList();

      return backTopRated;
    } catch (e) {
      return [];
    }
  }
}
