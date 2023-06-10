import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:villages/controller/shop/shop_page_controller.dart';
import 'package:villages/model/supermarket.dart';

import '../../components/supermarket_card.dart';

class SuperMarketPage extends StatelessWidget {
  const SuperMarketPage({
    Key? key,
    this.pageTitle = 'المحلات',
  }) : super(
          key: key,
        );
  final String? pageTitle;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShopPageController>(
      create: (context) => ShopPageController(),
      builder: (context, _) {
        var watch = context.watch<ShopPageController>();
        return Scaffold(
          appBar: AppBar(
            title: Text(pageTitle!),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: watch.shops.length /* supermarket.length */,
            itemBuilder: (ctx, i) {
              return SupermarketCard(
                markets: watch.shops[i] /* supermarket[i] */,
              );
            },
          ),
        );
      },
    );
  }
}
