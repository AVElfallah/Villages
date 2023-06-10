import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../assets/assets.dart';
import '../../../assets/colors.dart';

class SportClubCardWidget extends StatelessWidget {
  const SportClubCardWidget({
    super.key,
    this.imageUrl,
    this.serviceTitle,
    this.onTap,
    this.isNetworkImage,
    this.serviceSubTitle,
  }) : assert(imageUrl != null || isNetworkImage != null);
  final String? imageUrl;
  final String? serviceTitle;
  final String? serviceSubTitle;
  final bool? isNetworkImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: SizedBox(
        child: Column(
          children: [
            Flexible(
              child: isNetworkImage ?? false
                  ? CachedNetworkImage(
                      imageUrl: imageUrl!,
                      fit: BoxFit.fill,
                      height: 20.h,
                      width: 50.w,
                      errorWidget: (context, url, error) => Image.asset(
                        Assets.worker,
                        fit: BoxFit.fill,
                        height: 25.h,
                        width: 50.w,
                      ),
                      progressIndicatorBuilder: (context, url, progress) {
                        return Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        );
                      },
                    )
                  : Image.asset(
                      imageUrl ?? Assets.worker,
                      fit: BoxFit.fill,
                      height: 25.h,
                      width: 50.w,
                    ),
            ),
            Text(
              serviceTitle ?? '',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.6.sp,
                fontWeight: FontWeight.w800,
                color: InUseColors.componentsColor,
              ),
            ),
            Text(
              serviceSubTitle ?? '',
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
