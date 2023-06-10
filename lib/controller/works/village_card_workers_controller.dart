import 'package:flutter/material.dart';
import 'package:villages/model/workers.dart';
import 'package:villages/shared/data/api/job_and_workers_external.dart';

class VillageCardWorkersController extends ChangeNotifier {
  VillageCardWorkersController(int id) {
    _villageId = id;
  }

  int _villageId = 0;

  Future<List<WorkerModel>> villageCardWorkersByCategory() async {
    return await JobAndWorkersExternal.i.fetchWorkers(_villageId);
  }
}
