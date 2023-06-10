import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/controller/edit_phone_number/edit_phone_number_controller.dart';
import 'package:villages/views/login_view/login_view.dart';

class EditPhoneNum extends StatelessWidget {
  const EditPhoneNum({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditPhoneNumberController>(
      create: (_) => EditPhoneNumberController(),
      builder: (context, _) {
        var read = context.read<EditPhoneNumberController>();
        var watch = context.watch<EditPhoneNumberController>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('تعديل رقم الهاتف '),
            centerTitle: true,
          ),
          body: Form(
            key: watch.formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: InUseColors.appBarColor,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  const Text(
                    'أدخل رقم هاتفك',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Segoe UI',
                      color: InUseColors.componentsColor,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Text(
                    'نرجوا منك إدخال رقم هاتفك وسنقوم بتغييره على الفور',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Segoe UI',
                      color: InUseColors.componentsColor,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: InUseColors.componentsColor,
                        width: 1.2,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          ' +20 ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Segoe UI',
                            color: Colors.black,
                          ),
                        ),
                        const VerticalDivider(
                          color: InUseColors.componentsColor,
                          thickness: 1.2,
                          width: 1.2,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        DropdownButton(
                          value: watch.companyShortcut,
                          onChanged: read.changeCompanyShortcut,
                          dropdownColor: InUseColors.appBarColor,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: InUseColors.componentsColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Segoe UI',
                            color: Colors.black,
                          ),
                          items: ["10", "11", "12", "15"].map(
                            (value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        ),
                        const VerticalDivider(
                          color: InUseColors.componentsColor,
                          thickness: 1.2,
                          width: 1.2,
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            validator: read.validatePhoneNumber,
                            controller: watch.phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintText: 'أدخل رقم هاتفك',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Segoe UI',
                                color: InUseColors.hintColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ConstElevatedButton(
                    text: 'تغيير الرقم',
                    onPressed: () {
                      read.editPhoneNumber(
                        Navigator.of(context),
                        ScaffoldMessenger.of(context),
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
