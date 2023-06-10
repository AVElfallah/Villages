import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/views/login_view/login_view.dart';

import '../../controller/edit_password/edit_password_view_controller.dart';
import '../login_view/components/const_text_form_field.dart';

class EditPasswordView extends StatelessWidget {
  const EditPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditPasswordViewController>(
      create: (context) => EditPasswordViewController(),
      builder: (context, _) {
        var read = context.read<EditPasswordViewController>();
        var watch = context.watch<EditPasswordViewController>();
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
                    hint: 'كلمة المرور الحالية',
                    controller: watch.currentPasswordController,
                    validator: read.validatePassword,
                    isPassword: true,
                  ),
                  ConstTextFormField(
                    titleText: '',
                    hint: 'كلمة المرور الجديدة',
                    controller: watch.newPasswordController,
                    validator: read.validatePassword,
                    isPassword: true,
                  ),
                  ConstTextFormField(
                    titleText: '',
                    hint: 'تأكيد كلمة المرور ',
                    controller: watch.confirmPasswordController,
                    validator: read.validatePassword,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  ConstElevatedButton(
                    text: 'حفظ ',
                    onPressed: () {
                      read.editPassword(
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
      },
    );
  }
}
