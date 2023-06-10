import 'package:flutter/material.dart';
import 'package:villages/model/clinc_model.dart';

import '../../shared/data/api/doctors/hospital_clinc_external.dart';

class HospitalPageController extends ChangeNotifier {
  HospitalPageController() {
    loadClincs();
  }
  List<ClinicModel> clincs = [];

  loadClincs() async {
    clincs = await HospitalClincExternal.instance.fetchClinics();
    notifyListeners();
  }
}
