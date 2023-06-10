import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../assets/assets.dart';
import '../../../assets/colors.dart';

class EducationalServiceCardWidget extends StatelessWidget {
  const EducationalServiceCardWidget({
    super.key,
    this.imageUrl,
    this.serviceTitle,
    this.onTap,
    this.serviceSubTitle,
    this.isOnlineImage = false,
  });
  final String? imageUrl;
  final String? serviceTitle;
  final String? serviceSubTitle;
  final bool? isOnlineImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Card(
                color: InUseColors.backgroundColor,
                elevation: 1,
                child: !isOnlineImage!
                    ? Image.asset(
                        imageUrl ?? Assets.worker,
                        height: 20.h,
                        //width: 40.w,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: imageUrl!,
                        height: 20.h,
                        //width: 40.w,
                        fit: BoxFit.cover,

                        errorWidget: (context, url, error) {
                          return Image.asset(
                            Assets.worker,
                            height: 20.h,
                            //width: 40.w,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
              ),
            ),
            Text(
              serviceTitle ?? 'اسم الخدمة غير متاح',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w800,
                color: InUseColors.componentsColor,
              ),
            ),
            Text(
              serviceSubTitle ?? 'اسم الخدمة غير متاح',
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
  }
}
