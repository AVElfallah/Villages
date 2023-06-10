import 'package:flutter/material.dart';
import 'package:villages/shared/data/Client/user_auth.dart';
import 'package:villages/shared/data/api/profile_external_settings.dart';

class EditPhoneNumberController extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  //SECTION - Form Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //SECTION - Variables
  bool isLoading = false;
  String companyShortcut = '10';
  //SECTION - Validators
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف لا يمكن أن يكون فارغاً';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'رقم الهاتف غير صالح';
    }
    return null;
  }

  //SECTION - Functions
  void changeCompanyShortcut(val) {
    companyShortcut = val;
    notifyListeners();
  }

  void editPhoneNumber(
    NavigatorState nav,
    ScaffoldMessengerState scfm,
  ) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      var res = await ProfileExternalSettings.i.changePhone(
        '+20$companyShortcut${phoneNumberController.text}',
      );
      if (res) {
        scfm.showSnackBar(
          const SnackBar(
            content: Text('تم تغيير رقم الهاتف بنجاح'),
          ),
        );
        UserAuth.i
            .setNumber('+20$companyShortcut${phoneNumberController.text}');

        nav.pop();
      } else {
        scfm.showSnackBar(
          const SnackBar(
            content: Text('حدث خطأ ما'),
          ),
        );
      }
    } else {
      scfm.showSnackBar(
        const SnackBar(
          content: Text('حدث خطأ ما'),
        ),
      );
    }
    isLoading = false;
    notifyListeners();
  }
}
