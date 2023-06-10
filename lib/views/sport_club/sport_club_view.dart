import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/controller/club/club_page_controller.dart';

import 'package:villages/extension/string_extension.dart';

import 'components/sport_club_card_widget.dart';
// import model

class SportClubPage extends StatelessWidget {
  const SportClubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClubPageController>(
        create: (_) => ClubPageController(),
        builder: (context, _) {
          var watch = context.watch<ClubPageController>();
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'النادي الرياضى',
              ),
              centerTitle: true,
            ),
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: watch.clubs.isEmpty
                    ? const Center(
                        child: Text(
                          'لا توجد خدامات رياضية حالياً',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    : GridView.custom(
                        // crossAxisCount: 2,
                        childrenDelegate: SliverChildListDelegate(
                          [
                            for (var i in watch.clubs)
                              SportClubCardWidget(
                                imageUrl: i.image!.toBackendImage,
                                serviceTitle: i.name,
                                isNetworkImage: true,
                                onTap: () {},
                              ),
                            /* SportClubCardWidget(
                      imageUrl: Assets.playingPing,
                      serviceTitle: 'تنس طاولة',
                      serviceSubTitle: '',
                      onTap: () {},
                    ),
                    SportClubCardWidget(
                      imageUrl: Assets.bingoPlayer,
                      serviceTitle: 'بلياردو',
                      serviceSubTitle: '',
                      onTap: () {},
                    ),
                    SportClubCardWidget(
                      imageUrl: Assets.playingFootball,
                      serviceTitle: "كرة القدم",
                      serviceSubTitle: '',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => SuperMarketPage(
                              supermarket: SupermarketsData.i.supermarkets,
                            ),
                          ),
                        );
                      },
                    ),
                    SportClubCardWidget(
                      imageUrl: Assets.gym,
                      serviceTitle: "رفع الاثقال",
                      serviceSubTitle: '',
                      onTap: () {},
                    ),
                    SportClubCardWidget(
                      imageUrl: Assets.cyberPlayer,
                      serviceTitle: 'العاب الالكترونية',
                      serviceSubTitle: '',
                      onTap: () {},
                    ),
                    SportClubCardWidget(
                      imageUrl: Assets.playingChess,
                      serviceTitle: 'شطرنج',
                      serviceSubTitle: '',
                      onTap: () {},
                    ), */
                          ],
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .85,
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                        ),
                      ),
              ),
            ),
          );
        });
  }
}
