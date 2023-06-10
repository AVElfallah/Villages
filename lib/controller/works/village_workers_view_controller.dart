import 'package:flutter/material.dart';
import 'package:villages/model/job_catrgories_model.dart';
import 'package:villages/shared/data/api/job_and_workers_external.dart';

class VillageWorkersViewController extends ChangeNotifier {
  VillageWorkersViewController() {
    loadVillageWorkers();
  }

  List<JobCategoriesModel> _villageWorkers = [];
  List<JobCategoriesModel> get villageWorkers => _villageWorkers;

  loadVillageWorkers() async {
    _villageWorkers = await JobAndWorkersExternal.i.fetchJobCategories();
    notifyListeners();
  }
}
