import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/controller/works/village_card_workers_controller.dart';
import 'package:villages/extension/string_extension.dart';

import '../../../assets/assets.dart';
import '../../../assets/colors.dart';
import '../../../model/job_catrgories_model.dart';
import '../../../shared/views/layouts/workers_preview/workers_preview_page.dart';

class VillageCardWorkersWidget extends StatelessWidget {
  const VillageCardWorkersWidget({
    super.key,
    this.onTap,
    this.model,
  });

  final JobCategoriesModel? model;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var nav = Navigator.of(context);
    return ChangeNotifierProvider<VillageCardWorkersController>(
      create: (_) => VillageCardWorkersController(model!.id!),
      builder: (context, _) {
        var watch = context.watch<VillageCardWorkersController>();
        return InkWell(
          onTap: onTap ??
              () async {
                var workers = await watch.villageCardWorkersByCategory();

                nav.push(
                  MaterialPageRoute(
                    builder: (ctx) => WorkersPreviewPage(
                      pageTitle: model!.name,
                      workers: workers,
                    ),
                  ),
                );
              },
          child: SizedBox(
            child: Column(
              children: [
                Flexible(
                  child: Card(
                    color: InUseColors.backgroundColor,
                    elevation: 4,
                    child: model!.photo != null
                        ? CachedNetworkImage(
                            imageUrl: model!.photo!.toBackendImage,
                            fit: BoxFit.fill,
                            height: 25.h,
                            width: 50.w,
                          )
                        : Image.asset(
                            Assets.worker,
                            fit: BoxFit.fill,
                            height: 25.h,
                            width: 50.w,
                          ),
                  ),
                ),
                Text(
                  model!.name ?? 'اسم الخدمة غير متاح',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15.6.sp,
                    fontWeight: FontWeight.w800,
                    color: InUseColors.componentsColor,
                  ),
                ),
                Text(
                  '',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.w800,
                    color: InUseColors.componentsColor.withOpacity(.78),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
