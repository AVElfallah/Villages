import 'package:flutter/material.dart';
import 'package:villages/shared/data/api/profile_external_settings.dart';

class EditPasswordViewController extends ChangeNotifier {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  //SECTION - Form Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //SECTION - Variables
  bool isLoading = false;

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

  //SECTION - Functions
  void editPassword(
    NavigatorState nav,
    ScaffoldMessengerState scfm,
  ) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate() &&
        newPasswordController.text == confirmPasswordController.text) {
      var res = await ProfileExternalSettings.i.changePassword(
        currentPasswordController.text,
        newPasswordController.text,
      );
      var msg = 'تم تغيير كلمة المرور بنجاح ';
      if (!res) msg = 'حدث خطأ ما';
      scfm.showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );

      if (res) nav.pop();
    } else {
      scfm.showSnackBar(
        const SnackBar(
          content: Text(
            'كلمة المرور غير متطابقة',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    isLoading = false;
    notifyListeners();
  }
}
