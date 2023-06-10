import 'package:flutter/material.dart';
import 'package:villages/router/router.dart';
import 'package:villages/shared/data/api/user_forget_password.dart';

class VerifyViewController extends ChangeNotifier {
  VerifyViewController() {
    otpCtrl = List.generate(6, (index) => TextEditingController());
  }
  late List<TextEditingController> otpCtrl;
  late String email;

  void checkOtp(NavigatorState nav, ScaffoldMessengerState scfm) async {
    if (otpCtrl.every((element) => element.text.isNotEmpty)) {
      var res = await UserForgetPassword.i
          .checkOtp(email, otpCtrl.map((e) => e.text).join());
      if (res) {
        nav.popAndPushNamed(
          AppRouter.addNewPassword,
          arguments: {
            'email': email,
            'otp': otpCtrl.map((e) => e.text).join(),
          },
        );
      } else {
        scfm.showSnackBar(
          const SnackBar(
            content: Text('الرمز غير صحيح'),
          ),
        );
      }
    } else {
      scfm.showSnackBar(
        const SnackBar(
          content:
              Text('الرجاء إدخال الرمز الذي تم إرساله إلى بريدك الإلكتروني'),
        ),
      );
    }
  }
}
