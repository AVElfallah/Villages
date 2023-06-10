import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../assets/colors.dart';

class ConstTextFormField extends StatefulWidget {
  const ConstTextFormField({
    Key? key,
    required this.titleText,
    required this.hint,
    this.controller,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);

  final String titleText, hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<ConstTextFormField> createState() => _ConsttextFormfaildState();
}

class _ConsttextFormfaildState extends State<ConstTextFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            widget.titleText,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Segoe UI',
              color: InUseColors.componentsColor,
            ),
          ),
        ),
        SizedBox(
          height: .5.h,
        ),
        TextFormField(
          controller: widget.controller,
          textAlign: TextAlign.end,
          obscureText: widget.isPassword ? _isObscure : false,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: const TextStyle(
              color: InUseColors.hintColor,
            ),
            prefixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : null,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
