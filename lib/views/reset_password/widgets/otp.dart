import 'package:flutter/material.dart';

class TextFieldOTP extends StatelessWidget {
  final bool? last;
  final bool? first;
  final TextEditingController? controller;

  const TextFieldOTP({
    super.key,
    this.last = false,
    this.first = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: SizedBox(
        width: 50,
        height: 55,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counter: Offstage(
              offstage: true,
            ),
          ),
        ),
      ),
    );
  }
}
