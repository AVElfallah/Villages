import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/controller/auth/signup_screen_controller.dart';
import 'package:villages/views/login_view/login_view.dart';

import '../../router/router.dart';
import '../login_view/components/const_text_form_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpScreenController>(
      create: (_) => SignUpScreenController(),
      builder: (context, _) {
        var read = context.read<SignUpScreenController>();
        var watch = context.watch<SignUpScreenController>();
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: !watch.isLoading
                  ? Form(
                      key: watch.formKey,
                      child: Column(children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'إنشاء حساب جديد  ',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Segoe UI',
                                color: InUseColors.componentsColor,
                              ),
                            )),
                        SizedBox(
                          height: 4.h,
                        ),
                        ConstTextFormField(
                          titleText: 'الإسم الأول',
                          hint: 'يرجى إدخال الإسم الأول',
                          controller: watch.firstNameController,
                          validator: read.validateFirstName,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ConstTextFormField(
                          titleText: 'اسم العائلة',
                          hint: 'يرجى إدخال اسم العائلة',
                          controller: watch.lastNameController,
                          validator: read.validateLastName,
                        ),
                        SizedBox(
                          height: 2.h,
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
                        ConstTextFormField(
                          titleText: 'كلمة المرور',
                          hint: 'يرجى إدخال كلمة المرور',
                          isPassword: true,
                          controller: watch.passwordController,
                          validator: read.validatePassword,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ConstTextFormField(
                          titleText: 'تأكيد كلمة المرور',
                          hint: 'يرجى إدخال كلمة المرور',
                          isPassword: true,
                          controller: watch.confirmPasswordController,
                          validator: read.validateConfirmPassword,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        ConstElevatedButton(
                          text: 'إنشاء حساب جديد',
                          onPressed: () {
                            read.signup(
                              Navigator.of(context),
                              ScaffoldMessenger.of(context),
                            );
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pushNamed(
                                AppRouter.loginView,
                              ),
                              child: const Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Segoe UI',
                                  color: InUseColors.componentsColor,
                                ),
                              ),
                            ),
                            const Text(
                              'لديك حساب بالفعل ؟',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Segoe UI',
                                color: InUseColors.hintColor,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        );
      },
    );
  }
}
