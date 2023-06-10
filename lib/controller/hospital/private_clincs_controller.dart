import 'package:flutter/material.dart';
import 'package:villages/model/doctors/doctor_clinc.dart';

import '../../shared/data/api/doctors/private_clinc_external.dart';

class PrivateClincsController extends ChangeNotifier {
  PrivateClincsController() {
    loadDoctors();
  }
  List<DoctorClinic> doctors = [];

  loadDoctors() async {
    doctors = await PrivateClincExternal.instance.getAllDoctorsFromClinc();
    notifyListeners();
  }
}
