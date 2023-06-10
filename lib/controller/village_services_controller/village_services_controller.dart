import 'package:flutter/material.dart';
import 'package:villages/model/service_model.dart';

import '../../shared/data/api/village_sevices_external.dart';

class VillageServicesController extends ChangeNotifier {
  VillageServicesController() {
    loadServices();
  }
  List<ServiceModel> listServices = [];

  loadServices() async {
    listServices = await VillageSevicesExternal.i.fetchVillageServices();
    listServices.add(ServiceModel(
      id: 100,
      name: 'المحالات التجارية',
      photo: 'https://i.ibb.co/0jZ3Q0H/1.png',
    ));
    notifyListeners();
  }
}
