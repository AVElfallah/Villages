import 'dart:async';

import 'package:flutter/material.dart';
import 'package:villages/assets/assets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/router/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Timer timer;
  late AnimationController animCtrl;
  @override
  void initState() {
    super.initState();
    animCtrl = AnimationController(vsync: this)
      ..animateTo(
        6,
        duration: const Duration(milliseconds: 1800),
        curve: Curves.bounceInOut,
      );
    timer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      Navigator.of(context).pushReplacementNamed(
        AppRouter.welcomeScreen,
      );
    });
  }

  @override
  void dispose() {
    animCtrl.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: InUseColors.backgroundColor,
      child: Stack(
        children: [
          Image.asset(
            Assets.splashBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Village\nDevelopment',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.5.sp,
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AnimatedBuilder(
                  animation: animCtrl,
                  builder: (_, wid) {
                    return Transform.scale(
                      scale: animCtrl.value,
                      child: wid,
                    );
                  },
                  child: Image.asset(
                    Assets.logoPng,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تنمية القري المصرية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  Assets.egypt2030,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
