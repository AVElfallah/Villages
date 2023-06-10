import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/router/router.dart';
import 'package:villages/shared/data/supermarkets.dart';
import 'package:villages/shared/views/layouts/super_market/super_market_page.dart';

import '../../assets/assets.dart';
import 'components/social_service_card_widget.dart';

class SocialServicesScreen extends StatelessWidget {
  const SocialServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الخدمات الإجتماعية'),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: GridView.custom(
            // crossAxisCount: 2,
            childrenDelegate: SliverChildListDelegate.fixed(
              [
                SocialServiceCardWidget(
                  imageUrl: Assets.adobeFactory,
                  serviceTitle: 'مصنع طوب أحمر',
                  serviceSubTitle: '',
                  onTap: () {},
                ),
                SocialServiceCardWidget(
                  imageUrl: Assets.builderWorker,
                  serviceTitle: 'الحرف والعمال',
                  serviceSubTitle: '',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRouter.villageWorkersScreen,
                    );
                  },
                ),
                SocialServiceCardWidget(
                  imageUrl: Assets.shop,
                  serviceTitle: "المحلات",
                  serviceSubTitle: '',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const SuperMarketPage(),
                      ),
                    );
                  },
                ),
                SocialServiceCardWidget(
                  imageUrl: Assets.transactions,
                  serviceTitle: 'وسائل التنقل',
                  serviceSubTitle: '',
                  onTap: () {},
                ),
                SocialServiceCardWidget(
                  imageUrl: Assets.playground,
                  serviceTitle: 'النادي الرياضي',
                  serviceSubTitle: '',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRouter.sportClubPage,
                    );
                  },
                ),
              ],
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .85,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
            ),
          ),
        ),
      ),
    );
  }
}
