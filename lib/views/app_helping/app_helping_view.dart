import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/router/router.dart';
import 'package:villages/shared/data/Client/user_auth.dart';
import 'package:villages/shared/views/components/navbar_in_use.dart';
import 'package:villages/views/app_helping/components/help_card_widget.dart';

class AppHelpingPage extends StatelessWidget {
  const AppHelpingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var name = UserAuth.i.name;
    var email = UserAuth.i.email;
    return Scaffold(
      appBar: AppBar(
        title: const Text("المساعدة"),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.asset(
              'assets/images/verify.png',
              height: 30.h,
            ),
            // Image.asset('assets/images/email.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          name.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Segoe UI',
                            color: InUseColors.componentsColor,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          email,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Segoe UI',
                            color: InUseColors.componentsColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            HelpCardWidget(
              title: 'الملف الشخصى',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRouter.editProfileView,
                );
              },
              icon: Icons.arrow_forward_ios,
              firstIcon: Icons.manage_accounts,
            ),
            HelpCardWidget(
              title: 'تعديل كلمة المرور',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRouter.editPasswordView,
                );
              },
              icon: Icons.arrow_forward_ios,
              firstIcon: Icons.visibility_off_sharp,
            ),
            HelpCardWidget(
              title: "تواصل معنا",
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRouter.connectWithUsPage,
                );
              },
              icon: Icons.arrow_forward_ios,
              firstIcon: Icons.phone_in_talk_sharp,
            ),
            HelpCardWidget(
              title: 'تسجيل الخروج',
              onTap: () async {
                var of = Navigator.of(context);
                await UserAuth.i.resetUser();

                of.pushNamed(
                  AppRouter.loginView,
                );
              },
              icon: Icons.arrow_forward_ios,
              firstIcon: Icons.logout,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavbarInUse(
        page: 3,
      ),
    );
  }
}
