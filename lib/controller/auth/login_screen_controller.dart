import 'package:flutter/material.dart';

import 'package:villages/shared/data/Client/user_auth.dart';
import 'package:villages/shared/data/api/user_auth_external.dart';

import '../../router/router.dart';

class LoginScreenController extends ChangeNotifier {
  //SECTION - Text Editing Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور لا يمكن أن تكون فارغة';
    }
    if (value.length < 6) {
      return 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';
    }
    return null;
  }

  //SECTION - Functions
  void login(
    NavigatorState nav,
    ScaffoldMessengerState scfm,
  ) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      var res = await UserAuthExternal.i.login(
        emailController.text,
        passwordController.text,
      );

      if (res != null) {
        var saveUser = await UserAuth.i.saveUser(res);
        if (saveUser) {
          nav.pushNamedAndRemoveUntil(
              AppRouter.servicesMainScreen, (route) => false);
        }
      } else {
        scfm.showSnackBar(
          const SnackBar(
            content: Text('البريد الإلكتروني أو كلمة المرور غير صحيحة'),
          ),
        );
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
