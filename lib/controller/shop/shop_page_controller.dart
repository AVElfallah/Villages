import 'package:flutter/material.dart';
import 'package:villages/shared/data/api/shop_external.dart';

import '../../model/supermarket.dart';

class ShopPageController extends ChangeNotifier {
  ShopPageController() {
    loadShops();
  }
  List<SupermarketModel> shops = [];

  loadShops() async {
    shops = await ShopExternal.i.fetchShops();
    notifyListeners();
  }
}
