import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:villages/views/educational_services/components/educational_service_card_widget.dart';
import 'package:villages/extension/string_extension.dart';
import '../../controller/educational_services/educational_services_screen_controller.dart';

class EducationalServicesScreen extends StatelessWidget {
  const EducationalServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EducationalServicesScreenController>(
        create: (context) => EducationalServicesScreenController(),
        builder: (context, _) {
          var read = context.read<EducationalServicesScreenController>();
          var watch = context.watch<EducationalServicesScreenController>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('الخدمات التعليمية'),
              centerTitle: true,
            ),
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: GridView.custom(
                  childrenDelegate: SliverChildListDelegate.fixed(
                    [
                      ...[
                        for (var i in watch.schools)
                          EducationalServiceCardWidget(
                            isOnlineImage: true,
                            imageUrl: i.photo?.toBackendImage,
                            serviceTitle: i.name,
                            serviceSubTitle: i.name,
                            onTap: () {
                              read.toPage(
                                Navigator.of(context),
                                i.name!,
                                i.id.toString(),
                              );
                            },
                          )
                      ],
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
