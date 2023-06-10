import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/controller/forget_password/add_new_password_controller.dart';
import 'package:villages/extension/context_extension.dart';
import 'package:villages/views/login_view/login_view.dart';

import '../login_view/components/const_text_form_field.dart';

class AddNewPassword extends StatelessWidget {
  const AddNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddNewPasswordController>(
        create: (_) => AddNewPasswordController(),
        builder: (context, _) {
          var watch = context.watch<AddNewPasswordController>();
          var read = context.read<AddNewPasswordController>();
          read.setEmailAndOtp(context.args?['email'], context.args?['otp']);
          return Scaffold(
            appBar: AppBar(
              elevation: 4,
              title: const Text('تعديل كلمة المرور '),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: watch.formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Image.asset('assets/images/addnewpassword.png'),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Text(
                      'أدخل كلمة المرور الجديدة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe UI',
                        color: InUseColors.componentsColor,
                      ),
                    ),
                    ConstTextFormField(
                      titleText: '',
                      hint: 'كلمة المرور',
                      isPassword: true,
                      controller: watch.passwordController,
                      validator: read.validatePassword,
                    ),
                    ConstTextFormField(
                      titleText: '',
                      hint: 'تأكيد كلمة المرور ',
                      isPassword: true,
                      controller: watch.confirmPasswordController,
                      validator: read.validateConfirmPassword,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    ConstElevatedButton(
                      text: 'حفظ وتسجيل الدخول',
                      onPressed: () {
                        read.addNewPassword(
                          Navigator.of(context),
                          ScaffoldMessenger.of(context),
                        );
                      },
                    ),
                  ]),
                ),
              ),
            ),
          );
        });
  }
}
