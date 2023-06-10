import 'package:flutter/material.dart';
import 'package:villages/shared/data/api/user_forget_password.dart';

class AddNewPasswordController extends ChangeNotifier {
  //SECTION - Text Editing Controllers
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  //SECTION - Form Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //SECTION - Variables
  bool isLoading = false;

  late String email;
  late String otp;

  //SECTION - Validators
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور لا يمكن أن تكون فارغة';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون أكثر من 6 أحرف';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور لا يمكن أن تكون فارغة';
    }
    if (value != passwordController.text) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }

  //SECTION - Functions
  void setEmailAndOtp(String email, String otp) {
    this.email = email;
    this.otp = otp;
  }

  void addNewPassword(
    NavigatorState nav,
    ScaffoldMessengerState scfm,
  ) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      debugPrint(otp);
      var res = await UserForgetPassword.i
          .resetPassword(email, passwordController.text, otp);
      debugPrint(res.toString());
      if (res[1]) {
        scfm.showSnackBar(
          const SnackBar(
            content: Text('تم تغيير كلمة المرور بنجاح'),
          ),
        );
        nav.pop();
      } else {
        scfm.showSnackBar(
          const SnackBar(
            content: Text('حدث خطأ ما'),
          ),
        );
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
