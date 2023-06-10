import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/assets.dart';
import 'package:villages/extension/context_extension.dart';

import '../../../assets/colors.dart';

class WelcomeScreenLayout extends StatelessWidget {
  const WelcomeScreenLayout({
    Key? key,
    this.imagePath = Assets.shop,
    this.welcomeTitle = '',
    this.welcomeSubTile = '',
    this.activeButtonText = '',
    this.inActiveButtonText = '',
    this.currentPage = 0,
    this.dotCount = 2,
    this.activeButtonEnabled = false,
    this.inActiveButtonEnabled = false,
    this.onPressedActiveButton,
    this.onPressedInActiveButton,
  }) : super(key: key);

  final String? imagePath;
  final String? welcomeTitle;
  final String? welcomeSubTile;
  final String? activeButtonText;
  final String? inActiveButtonText;
  final void Function()? onPressedActiveButton;
  final void Function()? onPressedInActiveButton;
  final int? currentPage;
  final int? dotCount;
  final bool activeButtonEnabled;
  final bool inActiveButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: InUseColors.backgroundColor,
      child: SingleChildScrollView(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.vertical,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 45.h,
                width: context.isPortrait ? double.infinity : 34.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      imagePath!,
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      76,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                child: Text(
                  welcomeTitle!,
                  textAlign: TextAlign.center,
                  style: context.textTh.titleLarge!.copyWith(
                    color: InUseColors.componentsColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.24.h,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ),
                child: Text(
                  welcomeSubTile!,
                  textAlign: TextAlign.center,
                  style: context.textTh.titleMedium!.copyWith(
                    color: InUseColors.componentsColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.24.h,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var ind = 0; ind < dotCount!; ind++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: ClipOval(
                        child: Container(
                          width: 15,
                          height: 15,
                          color:
                              currentPage == ind ? Colors.green : Colors.grey,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 2.24.h,
            ),
            SizedBox(
              height: 17.h,
              width: double.infinity,
              child: Flex(
                direction: context.isPortrait ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Visibility(
                      visible: activeButtonEnabled,
                      child: Padding(
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        child: ElevatedButton(
                          onPressed: onPressedActiveButton,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: InUseColors.componentsColor,
                            minimumSize: Size(
                              context.isPortrait ? double.infinity : 200,
                              1.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                          ),
                          child: Text(
                            activeButtonText!,
                            style: context.textTh.headlineSmall!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Visibility(
                      visible: inActiveButtonEnabled,
                      child: Padding(
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        child: ElevatedButton(
                          onPressed: onPressedInActiveButton,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: InUseColors.shadingColor,
                            minimumSize: Size(
                              context.isPortrait ? double.infinity : 200,
                              1.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                          ),
                          child: Text(
                            inActiveButtonText!,
                            style: context.textTh.headlineSmall!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
