import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/controller/works/village_workers_view_controller.dart';

import 'package:villages/views/village_workers/components/village_card_workers.dart';

class VillageWorkersScreen extends StatelessWidget {
  const VillageWorkersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VillageWorkersViewController>(
        create: (_) => VillageWorkersViewController(),
        builder: (context, _) {
          var watch = context.watch<VillageWorkersViewController>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('الحرف والعمال'),
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
                      for (var mod in watch.villageWorkers)
                        VillageCardWorkersWidget(
                          model: mod,
                        )
                      /*  SocialServiceCardWidget(
                      imageUrl: Assets.elctWorker,
                      serviceTitle: 'كهربائي',
                      serviceSubTitle: '',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => WorkersPreviewPage(
                              pageTitle: "كهربائي",
                              workers: WorkersData.instance.elcWorkers,
                            ),
                          ),
                        );
                      },
                    ),
                    SocialServiceCardWidget(
                      imageUrl: Assets.plamersWorkers,
                      serviceTitle: 'سباك',
                      serviceSubTitle: '',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => WorkersPreviewPage(
                              pageTitle: "سباك",
                              workers: WorkersData.instance.plambers,
                            ),
                          ),
                        );
                      },
                    ),
                    SocialServiceCardWidget(
                      imageUrl: Assets.carpinterWorkers,
                      serviceTitle: "نجار",
                      serviceSubTitle: '',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => WorkersPreviewPage(
                              pageTitle: "نجار",
                              workers: WorkersData.instance.carpenters,
                            ),
                          ),
                        );
                      },
                    ),
                    SocialServiceCardWidget(
                      imageUrl: Assets.ciramicWorkers,
                      serviceTitle: 'مبلط',
                      serviceSubTitle: '',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => WorkersPreviewPage(
                              pageTitle: "مبلط",
                              workers: WorkersData.instance.grounder,
                            ),
                          ),
                        );
                      },
                    ),
                    SocialServiceCardWidget(
                      imageUrl: Assets.painterWorkers,
                      serviceTitle: 'نقاش',
                      serviceSubTitle: '',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => WorkersPreviewPage(
                              pageTitle: "نقاش",
                              workers: WorkersData.instance.painter,
                            ),
                          ),
                        );
                      },
                    ),
                    SocialServiceCardWidget(
                      imageUrl: Assets.transactions,
                      serviceTitle: 'سائق',
                      serviceSubTitle: '',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => WorkersPreviewPage(
                              pageTitle: "سائق",
                              workers: WorkersData.instance.drivers,
                            ),
                          ),
                        );
                      },
                    ), */
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
        });
  }
}
