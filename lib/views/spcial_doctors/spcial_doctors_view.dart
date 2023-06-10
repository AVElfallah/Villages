import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:villages/controller/hospital/private_clincs_controller.dart';

import 'package:villages/shared/data/spcial_doctor.dart';
import 'package:villages/views/spcial_doctors/components/spcial_doctor_card.dart';

class SpcialDoctorsPage extends StatelessWidget {
  const SpcialDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PrivateClincsController(),
      builder: (context, _) {
        var watch = context.watch<PrivateClincsController>();
        if (watch.doctors.isEmpty) {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'العيادات الخصوصية',
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: watch.doctors.length,
            itemBuilder: (_, i) => SpcialDoctorCard(
              doctorClinic: watch.doctors[i],
            ),
          ),
        );
      },
    );
  }
}
