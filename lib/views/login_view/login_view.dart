// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:villages/assets/colors.dart';
import 'package:villages/controller/auth/login_screen_controller.dart';
import 'package:villages/router/router.dart';

import 'components/const_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginScreenController>(
      create: (_) => LoginScreenController(),
      builder: (context, _) {
        var read = context.read<LoginScreenController>();
        var watch = context.watch<LoginScreenController>();
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: !watch.isLoading
                ? Form(
                    key: watch.formKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'تسجيل الدخول ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Segoe UI',
                              color: InUseColors.componentsColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
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
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRouter.resetPasswordView);
                            },
                            child: const Text(
                              'هل نسيت كلمة المرور؟',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Segoe UI',
                                color: InUseColors.componentsColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ConstElevatedButton(
                          text: 'تسجيل الدخول',
                          onPressed: () {
                            read.login(
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
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouter.signUpView);
                              },
                              child: const Text(
                                'اشترك الآن',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Segoe UI',
                                  color: InUseColors.componentsColor,
                                ),
                              ),
                            ),
                            const Text(
                              'ليس لديك حساب؟',
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
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}

class ConstElevatedButton extends StatelessWidget {
  const ConstElevatedButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          InUseColors.componentsColor,
        ),
        fixedSize: MaterialStateProperty.all(
          Size(
            MediaQuery.of(context).size.width,
            48,
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe UI',
          color: Colors.white,
        ),
      ),
    );
  }
}
