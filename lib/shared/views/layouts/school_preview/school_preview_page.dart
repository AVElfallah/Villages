import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';

import 'package:villages/model/teacher.dart';
import 'package:villages/shared/constants/constant.dart';
import 'package:villages/shared/views/components/teacher_school_card.dart';

import '../../../../extension/dialogs.dart';

class SchoolPreviewPage extends StatelessWidget {
  const SchoolPreviewPage({
    Key? key,
    this.pageTitle,
    this.teachers,
  }) : super(
          key: key,
        );
  final String? pageTitle;
  final List<TeacherModel>? teachers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle!),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: teachers!.length,
        itemBuilder: (
          context,
          i,
        ) {
          var teacher2 = teachers![i];
          if (i == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 35,
                  ),
                  child: Text(
                    "المدرسـين",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: InUseColors.componentsColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(
                  color: InUseColors.componentsColor,
                  thickness: 1.5,
                  indent: 65.w,
                  endIndent: 6.5.w,
                ),
                InkWell(
                  onDoubleTap: () {
                    AppDialogs.showRationgDialog(
                      rateTeacherAPI,
                      teacher2.id!,
                      context,
                    );
                  },
                  child: TeacherSchoolCard(
                    teacher: teacher2,
                  ),
                ),
              ],
            );
          } else {
            return InkWell(
              onDoubleTap: () {
                AppDialogs.showRationgDialog(
                  rateTeacherAPI,
                  teacher2.id!,
                  context,
                );
              },
              child: TeacherSchoolCard(
                teacher: teachers![i],
              ),
            );
          }
        },
      ),
    );
  }
}
