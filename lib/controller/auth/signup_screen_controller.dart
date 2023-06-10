import 'package:flutter/material.dart';
import 'package:villages/model/auth/user_data.dart';
import 'package:villages/shared/data/Client/user_auth.dart';

import '../../router/router.dart';
import '../../shared/data/api/user_auth_external.dart';

class SignUpScreenController extends ChangeNotifier {
  //SECTION - Text Editing Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //SECTION - Form Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //SECTION - Variables
  bool isLoading = false;

  //SECTION - Validators
  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'الإسم الأول لا يمكن أن يكون فارغاً';
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'اسم العائلة لا يمكن أن يكون فارغاً';
    }
    return null;
  }

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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور لا يمكن أن يكون فارغاً';
    }
    if (value != passwordController.text) {
      return 'تأ...كيد كلمة المرور غير صحيح';
    }
    return null;
  }

  //SECTION -  method to make a signup request
  void signup(NavigatorState navigatorState, ScaffoldMessengerState sfc) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      //SECTION -  make the signup request
      UserDataModel signupModel = UserDataModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      var res = await UserAuthExternal.i.signup(signupModel);
      if (res != null) {
        var saveUser = await UserAuth.i.saveUser(res);
        if (saveUser) {
          sfc.showSnackBar(
            const SnackBar(
              content: Text('تم التسجيل بنجاح سوف يتم نقلك للصفحة الرئيسية'),
              backgroundColor: Colors.green,
            ),
          );
          navigatorState.pushNamedAndRemoveUntil(
            AppRouter.splashScreen,
            (route) => false,
          );
        } else {
          sfc.showSnackBar(
            const SnackBar(
              content:
                  Text("تم التسجيل بنجاح سوف يتم نقلك للصفحة تسجيل الدخول"),
              backgroundColor: Colors.greenAccent,
            ),
          );
          navigatorState.pushNamedAndRemoveUntil(
            AppRouter.loginView,
            (route) => false,
          );
        }
      } else {
        //SECTION -  show error message
        debugPrint('Error');
        sfc.showSnackBar(
          const SnackBar(
            content: Text('حدث خطأ ما، يرجى المحاولة مرة أخرى'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
