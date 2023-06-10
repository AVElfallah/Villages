import 'package:dio/dio.dart';
import 'package:villages/model/supermarket.dart';

import '../../constants/constant.dart';

class ShopExternal {
  ShopExternal._();
  static final ShopExternal instance = ShopExternal._();
  static ShopExternal get i => instance;

  Future<List<SupermarketModel>> fetchShops() async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: shopAPI,
        ),
      ).get('');
      var data = (res).data['data'] as List;
      var shops = data.map((e) => SupermarketModel.fromJson(e)).toList();
      return shops;
    } catch (e) {
      return [];
    }
  }
}
