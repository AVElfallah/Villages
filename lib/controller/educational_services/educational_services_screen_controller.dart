import 'package:flutter/material.dart';
import 'package:villages/model/school_model.dart';
import 'package:villages/shared/data/api/school_external.dart';

import '../../shared/views/layouts/school_preview/school_preview_page.dart';

class EducationalServicesScreenController extends ChangeNotifier {
  EducationalServicesScreenController() {
    setSchools();
  }
  List<SchoolModel> schools = [];
  void setSchools() async {
    schools = await SchoolExternal.i.getSchools();

    notifyListeners();
  }

  toPage(NavigatorState nav, String schoolName, String id) async {
    var lis = await SchoolExternal.i.getTeacherBySchool(id);
    nav.push(
      MaterialPageRoute(
        builder: (ctx) => SchoolPreviewPage(
          pageTitle: schoolName,
          teachers: lis,
        ),
      ),
    );
  }
}
