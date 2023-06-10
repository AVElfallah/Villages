import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../../../assets/colors.dart';

openTelephoneDialog(BuildContext context, String phoneNumber, String title) {
  Uri phoneno = Uri.parse('tel:+2$phoneNumber');
  var of = Navigator.of(context);
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          backgroundColor: InUseColors.backgroundColor,
          icon: const Icon(Icons.warning, color: Colors.red),
          title: const Text(
            'تنبيه',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            ' هل تريد الاتصال بـ $title؟',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                'لا',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                if (await url_launcher.launchUrl(phoneno)) {
                  //dialer opened
                } else {
                  //dailer is not opened
                }

                of.pop();
              },
              child: const Text(
                'نعم',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      });
}
