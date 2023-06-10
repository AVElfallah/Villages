import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/extension/string_extension.dart';

import '../../../assets/assets.dart';
import '../../../assets/colors.dart';

class VillageServiceCardWidget extends StatelessWidget {
  const VillageServiceCardWidget(
      {super.key,
      this.imageUrl,
      this.serviceName,
      this.onTap,
      this.isLoacalImage = false});
  final String? imageUrl;
  final String? serviceName;
  final bool isLoacalImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: SizedBox(
        child: Column(
          children: [
            if (!isLoacalImage)
              Flexible(
                  flex: 0,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl!.toBackendImage,
                    fit: BoxFit.fill,
                    errorWidget: (c, s, d) => Image.asset(
                      Assets.worker,
                      height: 18.h,
                      width: 50.w,
                      fit: BoxFit.cover,
                    ),
                  )),
            if (isLoacalImage)
              Flexible(
                  flex: 0,
                  child: Image.asset(
                    Assets.worker,
                    height: 18.h,
                    width: 50.w,
                    fit: BoxFit.cover,
                  )),
            Flexible(
              flex: 1,
              child: Text(
                serviceName ?? 'اسم الخدمة غير متاح',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: InUseColors.componentsColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
