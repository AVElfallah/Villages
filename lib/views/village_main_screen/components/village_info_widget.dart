import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../assets/assets.dart';
import '../../../assets/colors.dart';

class VillageInfoWidget extends StatelessWidget {
  const VillageInfoWidget({
    Key? key,
    this.imageURl,
    this.villageName = '',
    this.villageShortInfo = '',
    this.knowMoreOnPressed,
  }) : super(key: key);
  final String? imageURl;
  final String? villageName;
  final String? villageShortInfo;
  final void Function()? knowMoreOnPressed;
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
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
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: isPortrait ? 54.w : 28.w,
                height: isPortrait ? 6.4.h : 8.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: InUseColors.componentsColor,
                      size: 28.sp,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      villageName ?? '',
                      style: TextStyle(
                        color: InUseColors.componentsColor,
                        fontSize: 18.sp,
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
                maxLines: 3,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  shadows: const [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Align(
              alignment:
                  isPortrait ? Alignment.bottomCenter : Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: knowMoreOnPressed ?? () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: isPortrait
                      ? Size(
                          25.w,
                          30,
                        )
                      : Size(
                          double.infinity,
                          6.h,
                        ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      35,
                    ),
                  ),
                ),
                child: Text(
                  'معرفة المزيد',
                  style: TextStyle(
                    color: InUseColors.componentsColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.5.sp,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
