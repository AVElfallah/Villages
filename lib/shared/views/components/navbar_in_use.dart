import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/assets.dart';
import 'package:villages/router/router.dart';

import '../../../assets/colors.dart';

class NavbarInUse extends StatefulWidget {
  const NavbarInUse({
    Key? key,
    required this.page,
  }) : super(key: key);
  final int page;
  @override
  State<NavbarInUse> createState() => _NavbarInUseState();
}

class _NavbarInUseState extends State<NavbarInUse> {
  late int page;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    page = widget.page;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'navbar_inuse',
      child: Material(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: 9.h,
            child: Stack(
              children: [
                CurvedNavigationBar(
                  backgroundColor: InUseColors.appBarColor,
                  color: InUseColors.appBarColor,
                  buttonBackgroundColor: Colors.green,
                  key: _bottomNavigationKey,
                  items: [
                    Icon(
                      CupertinoIcons.home,
                      size: 30,
                      color: page == 0 ? Colors.white : Colors.green,
                    ),
                    Icon(
                      Icons.dashboard,
                      size: 30,
                      color: page == 1 ? Colors.white : Colors.green,
                    ),
                    Image(
                      image: const AssetImage(
                        Assets.phoneIcon,
                      ),
                      width: 30,
                      height: 25,
                      color: page == 2 ? Colors.white : Colors.green,
                    ),
                    Image(
                      image: const AssetImage(
                        Assets.helpIcon,
                      ),
                      width: 30,
                      height: 30,
                      color: page == 3 ? Colors.white : Colors.green,
                    ),
                  ],
                  index: page,
                  onTap: (index) {
                    if (index == 0 && page != index) {
                      Navigator.of(context).pushReplacementNamed(
                        AppRouter.servicesMainScreen,
                      );
                    } else if (index == 1 && page != index) {
                      Navigator.of(context).pushReplacementNamed(
                        AppRouter.villageServicesScreen,
                      );
                    } else if (index == 2 && page != index) {
                      Navigator.of(context).pushReplacementNamed(
                        AppRouter.emergencyPage,
                      );
                    } else if (index == 3 && page != index) {
                      Navigator.of(context).pushReplacementNamed(
                        AppRouter.appHelpingPage,
                      );
                    }
                  },
                ),
                Positioned(
                  left: 6.w,
                  top: 4.5.h,
                  child: const Text(
                    "مساعدة",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  left: 32.w,
                  top: 4.5.h,
                  child: const Text(
                    "الطوارئ",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  left: 56.w,
                  top: 4.5.h,
                  child: const Text(
                    "الخدمات",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  left: 82.w,
                  top: 4.5.h,
                  child: const Text(
                    "الرئيسية",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
