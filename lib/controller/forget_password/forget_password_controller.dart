import 'package:flutter/material.dart';
import 'package:villages/router/router.dart';
import 'package:villages/shared/data/api/user_forget_password.dart';

class ForgetPasswordController extends ChangeNotifier {
  //SECTION - Text Editing Controllers
  TextEditingController emailController = TextEditingController();
  //SECTION - Form Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //SECTION - Variables
  bool isLoading = false;
  //SECTION - Validators
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني لا يمكن أن يكون فارغاً';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'البريد الإلكتروني غير صالح';
    }
    return null;
  }

  //SECTION - Functions
  void forgetPassword(
    NavigatorState nav,
    ScaffoldMessengerState scfm,
  ) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      List? res = await UserForgetPassword.i.forgetPassword(
        emailController.text,
      );
      if (res[1]) {
        scfm.showSnackBar(
          const SnackBar(
            content: Text(
                'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني'),
          ),
        );
        nav.popAndPushNamed(
          AppRouter.verifyView,
          arguments: {
            'email': emailController.text,
          },
        );
      } else {
        scfm.showSnackBar(
          const SnackBar(
            content: Text('البريد الإلكتروني غير مسجل'),
          ),
        );
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
