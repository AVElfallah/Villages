import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/assets.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/extension/string_extension.dart';
import 'package:villages/router/router.dart';
import 'package:villages/shared/views/components/navbar_in_use.dart';
import 'package:villages/views/village_main_screen/components/services_card_widget.dart';

import '../../controller/services_main_screen/services_main_screen_controller.dart';
import '../../shared/data/teachers.dart';
import '../../shared/views/layouts/school_preview/school_preview_page.dart';
// import model

class VillageMainScreen extends StatefulWidget {
  const VillageMainScreen({super.key});

  @override
  State<VillageMainScreen> createState() => _VillageMainScreenState();
}

class _VillageMainScreenState extends State<VillageMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ChangeNotifierProvider<VillageMainScreenController>(
        create: (_) => VillageMainScreenController(),
        lazy: true,
        child: Consumer<VillageMainScreenController>(
          builder: ((
            context,
            ctrl,
            child,
          ) {
            final isPortrait =
                MediaQuery.of(context).orientation == Orientation.portrait;
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(
                  double.infinity,
                  isPortrait ? 24.h : 25.h,
                ),
                child: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.all(
                      18,
                    ),
                    height: isPortrait ? 7.h : 14.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              constraints: BoxConstraints(
                                maxWidth: isPortrait ? double.infinity : 25.w,
                              ),
                              hintText: 'البحــث عن قرية او خدمة داخل القرية',
                              hintTextDirection: TextDirection.rtl,
                              filled: true,
                              fillColor: InUseColors.appBarColor,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: InUseColors.appBarColor,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: InUseColors.componentsColor,
                                ),
                              ),
                              suffixIcon: const Icon(
                                Icons.search,
                                color: InUseColors.componentsColor,
                              ),
                            ),
                          ),
                        ),
                        /* IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRouter.notificationPage,
                            );
                          },
                          icon: const Icon(
                            Icons.notifications_none,
                            size: 35,
                            color: Colors.green,
                          ),
                        ), */
                      ],
                    ),
                  ),
                ),
              ),
              body: ListView(
                children: [
                  Builder(builder: (ctx) {
                    var villages =
                        ctrl.getVillageInfoWidgets(Navigator.of(context));
                    if (villages.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      height: 27.h,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        children: villages,
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.all(
                      13.0,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'الخدمات الجديدة التى تمت إضافتها ',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: InUseColors.componentsColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Divider(
                          color: InUseColors.componentsColor,
                          endIndent: isPortrait ? 35.w : 65.w,
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: isPortrait ? 25.h : 30.h,
                    child: GridView.count(
                      crossAxisCount: isPortrait ? 2 : 3,
                      childAspectRatio: 2,
                      children: [
                        for (var serv in ctrl.services.reversed)
                          ServicesCardWidget(
                            serviceName: serv.name,
                            serviceImageURL: serv.photo,
                            isOnlinePhoto: true,
                            onTap: () {
                              AppRouter.toServiceByName(context, serv.name!);
                            },
                          ),
                        if (ctrl.services.isEmpty)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      13.0,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'الخدمات الأعلى تقييم داخل القرية ',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: InUseColors.componentsColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Divider(
                          color: InUseColors.componentsColor,
                          endIndent: isPortrait ? 35.w : 65.w,
                          thickness: 2,
                        ),
                        if (ctrl.topRated.isEmpty)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        if (ctrl.topRated.isNotEmpty)
                          for (var i = 0;
                              i < ctrl.topRated.length ~/ 2;
                              i++) ...[
                            ListTile(
                              onTap: () {
                                AppRouter.toWorkerByName(
                                    context, ctrl.topRated[i].name!);
                              },
                              tileColor: InUseColors.appBarColor,
                              title: Text(
                                ctrl.topRated[i].name!,
                                style: const TextStyle(
                                  color: InUseColors.componentsColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    ctrl.topRated[i].rateAvge
                                        .toStringAsFixed(2),
                                    style: const TextStyle(
                                      color: InUseColors.componentsColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                              trailing: SizedBox(
                                height: 100,
                                width: 100,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      ctrl.topRated[i].photo!.toBackendImage,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        SizedBox(
                          height: 7.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: const NavbarInUse(
                page: 0,
              ),
            );
          }),
        ),
      ),
    );
  }
}
