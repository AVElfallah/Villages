import 'package:flutter/material.dart';
import 'package:villages/model/doctors/h_doctor.dart';

import 'package:villages/shared/views/components/hospital_doctor_card.dart';

import '../../../../extension/dialogs.dart';
import '../../../constants/constant.dart';

class HospitalDoctorsPreviewPage extends StatelessWidget {
  const HospitalDoctorsPreviewPage({
    Key? key,
    required this.doctors,
    required this.title,
  }) : super(key: key);
  final List<HDoctor> doctors;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (_, i) {
          var doctor2 = doctors[i];
          return InkWell(
            onTap: () {
              AppDialogs.showRationgDialog(
                rateHospitalDoctorAPI,
                doctor2.id!,
                context,
              );
            },
            child: HospitalDoctorCard(
              doctor: doctor2,
            ),
          );
        },
      ),
    );
  }
}
