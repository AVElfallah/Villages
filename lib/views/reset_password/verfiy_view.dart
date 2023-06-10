import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/controller/forget_password/verify_view_controller.dart';
import 'package:villages/extension/context_extension.dart';
import 'package:villages/views/login_view/login_view.dart';

import 'widgets/otp.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var email = context.args?['email'];
    return ChangeNotifierProvider<VerifyViewController>(
      create: (_) => VerifyViewController(),
      builder: (context, _) {
        var watch = context.watch<VerifyViewController>();
        watch.email = email;
        var read = context.read<VerifyViewController>();
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                SizedBox(
                  height: 20.h,
                ),
                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'تحقق من بريدك الإلكترونى  ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe UI',
                        color: InUseColors.componentsColor,
                      ),
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Image.asset('assets/images/verify.png'),
                SizedBox(
                  height: 2.h,
                ),
                const Text(
                  'أدخل رمز الأمان المرسل إلى بريدك الإلكترونى لإعادة تعيين كلمة المرور',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe UI',
                    color: InUseColors.componentsColor,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var i = 0; i < watch.otpCtrl.length; i++)
                      TextFieldOTP(
                        first: i == 0,
                        controller: watch.otpCtrl[i],
                        last: i == watch.otpCtrl.length - 1,
                      )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                ConstElevatedButton(
                  text: 'إرسال',
                  onPressed: () {
                    read.checkOtp(
                        Navigator.of(context), ScaffoldMessenger.of(context));
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      'اطلب رمزًا جديدًا',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe UI',
                        color: InUseColors.componentsColor,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
