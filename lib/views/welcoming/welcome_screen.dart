import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:villages/assets/assets.dart';
import 'package:villages/controller/welcoming/welcome_screen_controller.dart';
import 'package:villages/router/router.dart';
import 'package:villages/views/welcoming/layouts/welcome_screen_layout.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WelcomeScreenController>(
      create: (_) => WelcomeScreenController(),
      child: Consumer<WelcomeScreenController>(
        builder: ((context, ctrl, child) {
          return PageView(
            controller: ctrl.pageCtrl,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              WelcomeScreenLayout(
                activeButtonEnabled: true,
                activeButtonText: 'التالي',
                onPressedActiveButton: () {
                  ctrl.changePage();
                },
                inActiveButtonEnabled: true,
                inActiveButtonText: 'تخطي',
                onPressedInActiveButton: () {
                  Navigator.of(context).pushNamed(
                    AppRouter.villageReviewScreen,
                  );
                },
                welcomeTitle: 'نسعى إلى الحفاظ علي البيئة والتنمية معا ',
                welcomeSubTile:
                    'من خلال خلق الوعى الإجتماعى لحفظ حقوق الأجيال القادمة في مستقبل أكثر أمنا',
                imagePath: Assets.hands,
                currentPage: ctrl.page,
                dotCount: 2,
              ),
              WelcomeScreenLayout(
                activeButtonEnabled: true,
                activeButtonText: 'ابدأ الأن',
                onPressedActiveButton: () {
                  Navigator.of(context).pushReplacementNamed(
                    AppRouter.loginView,
                  );
                },
                welcomeTitle: 'قرية رأس الخليج البلد ',
                welcomeSubTile:
                    'تقع رأس الخليج على ضفة نهر النيل فرع دمياط وتبلغ مساحتها حوالى 3400فدان',
                imagePath: Assets.villageEagleEye,
                currentPage: ctrl.page,
                dotCount: 2,
              ),
            ],
          );
        }),
      ),
    );
  }
}
