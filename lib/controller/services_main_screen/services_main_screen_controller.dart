import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:villages/model/service_model.dart';
import 'package:villages/router/router.dart';
import 'package:villages/shared/data/api/village_sevices_external.dart';
import 'package:villages/views/village_main_screen/components/village_info_widget.dart';

import '../../assets/assets.dart';
import '../../model/top_rated_model.dart';
import '../../model/village_model.dart';
// import model

class VillageMainScreenController extends ChangeNotifier {
  VillageMainScreenController() {
    VillageSevicesExternal.i.fetchVillages().then((value) {
      vellages = value;
      notifyListeners();
    });
    //Services
    Isolate.run(() async {
      return await VillageSevicesExternal.i.fetchVillageServices();
    }).then((value) {
      services = value;
      notifyListeners();
    });
    //TopRated
    Isolate.run(() async {
      return await VillageSevicesExternal.i.getTopRatedVillages();
    }).then((value) {
      topRated = value;
      notifyListeners();
    });
  }
  //page
  int page = 0;
  List<VillageModel> vellages = [];

  List<ServiceModel> services = [];

  List<TopRated> topRated = [];

  List<VillageInfoWidget> getVillageInfoWidgets(NavigatorState nav) => vellages
      .map((e) => VillageInfoWidget(
            villageName: e.name,
            villageShortInfo: e.location,
            imageURl: Assets.villagePreview,
            knowMoreOnPressed: () {
              nav.pushNamed(AppRouter.villageServicesScreen);
            },
          ))
      .toList();

  //change page
  void changePage(int page) {
    this.page = page;
    notifyListeners();
  }
}
