import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/controller/village_services_controller/village_services_controller.dart';
import 'package:villages/extension/context_extension.dart';
import 'package:villages/router/router.dart';
import 'package:villages/shared/views/components/navbar_in_use.dart';
import 'package:villages/views/village_services_screen/components/village_service_card_widget.dart';

class VillageServicesScreen extends StatelessWidget {
  const VillageServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var name = context.args?['village_name'] ?? 'قرية رأس الخليج البلد';

    return ChangeNotifierProvider<VillageServicesController>(
      create: (_) => VillageServicesController(),
      lazy: true,
      child: Consumer<VillageServicesController>(
        builder: (context, ctrl, _) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                name ?? '',
                style: TextStyle(
                  color: InUseColors.componentsColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'الخدمات المتاحة داخل القرية ',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: InUseColors.componentsColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: InUseColors.componentsColor,
                    endIndent: context.isPortrait ? 35.w : 65.w,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: context.isPortrait ? 60.h : 60.h,
                    child: GridView.custom(
                      //  physics: const NeverScrollableScrollPhysics(),
                      //  controller: scrollController,
                      // crossAxisCount: 2,
                      childrenDelegate: SliverChildListDelegate.fixed(
                        [
                          for (var item in ctrl.listServices)
                            VillageServiceCardWidget(
                              imageUrl: item.photo,
                              serviceName: item.name,
                              isLoacalImage: item.name == 'المحالات التجارية',
                              onTap: () {
                                AppRouter.toServiceByName(context, item.name!);
                              },
                            )
                          /* VillageServiceCardWidget(
                            imageUrl: Assets.worker,
                            serviceName: 'الخدمات الحكومية',
                            onTap: () {},
                          ),
                          VillageServiceCardWidget(
                            imageUrl: Assets.school,
                            serviceName: 'الخدمات التعليمية',
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRouter.educationalServicesScreen,
                              );
                            },
                          ),
                          VillageServiceCardWidget(
                            imageUrl: Assets.socialServices,
                            serviceName: 'الخدمات الإجتماعية',
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRouter.socialServicesScreen,
                              );
                            },
                          ),
                          VillageServiceCardWidget(
                            imageUrl: Assets.bonesDoctor,
                            serviceName: 'الخدمات الصحية',
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRouter.medicalServicesScreen,
                              );
                            },
                          ), */
                        ],
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: context.isPortrait ? 1 : 1.5,
                        crossAxisCount: context.isPortrait ? 2 : 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: const NavbarInUse(
              page: 1,
            ),
          );
        },
      ),
    );
  }
}
