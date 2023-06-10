import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/controller/forget_password/forget_password_controller.dart';
import 'package:villages/views/login_view/login_view.dart';

import '../login_view/components/const_text_form_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgetPasswordController>(
        create: (_) => ForgetPasswordController(),
        builder: (context, _) {
          var read = context.read<ForgetPasswordController>();
          var watch = context.watch<ForgetPasswordController>();
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: !watch.isLoading
                    ? Form(
                        key: read.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'استعادة كلمة المرور ',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Segoe UI',
                                  color: InUseColors.componentsColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const Text(
                              'يمكنك استعادة كلمة المرور الخاصة بك من خلال البريد الإلكترونى الخاص بك',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Segoe UI',
                                color: InUseColors.componentsColor,
                              ),
                            ),
                            Image.asset('assets/images/resetpassword.png'),
                            SizedBox(
                              height: 1.h,
                            ),
                            ConstTextFormField(
                              titleText: 'البريد الإلكترونى',
                              hint: 'يرجى إدخال البريد الإلكترونى',
                              controller: watch.emailController,
                              validator: read.validateEmail,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            ConstElevatedButton(
                              text: 'ارسال رقم التحقق',
                              onPressed: () {
                                read.forgetPassword(
                                  Navigator.of(context),
                                  ScaffoldMessenger.of(context),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
          );
        });
  }
}
