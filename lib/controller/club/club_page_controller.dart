import 'package:flutter/material.dart';
import 'package:villages/model/club_model.dart';

import '../../shared/data/api/club_external.dart';

class ClubPageController extends ChangeNotifier {
  ClubPageController() {
    loadClubs();
  }
  List<ClubModel> _clubs = [];
  List<ClubModel> get clubs => _clubs;

  void loadClubs() async {
    _clubs = await ClubExternal.i.fetchClubs();
    notifyListeners();
  }
}
