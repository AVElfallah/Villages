import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../assets/assets.dart';
import '../../../assets/colors.dart';

class SelectedVillageInfoWidget extends StatelessWidget {
  const SelectedVillageInfoWidget({
    Key? key,
    this.imageURl,
    this.villageName = '',
    this.villageShortInfo = '',
  }) : super(key: key);
  final String? imageURl;
  final String? villageName;
  final String? villageShortInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            imageURl ?? Assets.appTesting,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 56.w,
                height: 6.5.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: InUseColors.componentsColor,
                      size: 28.sp,
                    ),
                    Text(
                      villageName ?? '',
                      style: TextStyle(
                        color: InUseColors.componentsColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                villageShortInfo!,
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
                maxLines: 4,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  shadows: const [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 18,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
