import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../assets/assets.dart';
import '../../../assets/colors.dart';

class SocialServiceCardWidget extends StatelessWidget {
  const SocialServiceCardWidget({
    super.key,
    this.imageUrl,
    this.serviceTitle,
    this.onTap,
    this.serviceSubTitle,
  });
  final String? imageUrl;
  final String? serviceTitle;
  final String? serviceSubTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: SizedBox(
        child: Column(
          children: [
            Flexible(
              child: Card(
                color: InUseColors.backgroundColor,
                elevation: 4,
                child: Image.asset(
                  imageUrl ?? Assets.worker,
                  fit: BoxFit.fill,
                  height: 25.h,
                  width: 50.w,
                ),
              ),
            ),
            Text(
              serviceTitle ?? 'اسم الخدمة غير متاح',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.6.sp,
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
