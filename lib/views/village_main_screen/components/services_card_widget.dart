import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/extension/string_extension.dart';

import '../../../assets/assets.dart';
import '../../../assets/colors.dart';

class ServicesCardWidget extends StatelessWidget {
  const ServicesCardWidget({
    Key? key,
    this.serviceName,
    this.serviceImageURL,
    this.isOnlinePhoto = false,
    this.onTap,
  }) : super(key: key);
  final String? serviceName;
  final String? serviceImageURL;
  final bool? isOnlinePhoto;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 50,
        height: 20,
        child: Container(
          width: 40,
          height: 20,
          color: InUseColors.appBarColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isOnlinePhoto!)
                Image.asset(
                  serviceImageURL ?? Assets.appTesting,
                  width: 20.w,
                ),
              if (isOnlinePhoto!)
                CachedNetworkImage(
                  imageUrl: serviceImageURL!.toBackendImage,
                  width: 20.w,
                ),
              Text(
                serviceName ?? 'no name',
                style: const TextStyle(
                  color: InUseColors.componentsColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
