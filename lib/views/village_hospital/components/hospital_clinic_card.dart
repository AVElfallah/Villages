import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/extension/string_extension.dart';

import '../../../model/clinc_model.dart';
import '../../../shared/data/api/doctors/hospital_clinc_external.dart';
import '../../../shared/views/layouts/hospital_doctors_preview/hospital_doctors_preview_page.dart';

class HospitalClinicCard extends StatelessWidget {
  const HospitalClinicCard({
    Key? key,
    required this.clinic,
    this.onTap,
  }) : super(key: key);

  final ClinicModel clinic;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var navof = Navigator.of(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: onTap ??
            () async {
              var fetchClincDoctorsByID =
                  await HospitalClincExternal.instance.fetchClincDoctorsByID(
                clinic.id,
              );

              navof.push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return HospitalDoctorsPreviewPage(
                      title: clinic.name,
                      doctors: fetchClincDoctorsByID,
                    );
                  },
                ),
              );
            },
        child: Column(
          children: [
            Flexible(
              flex: 0,
              child: CachedNetworkImage(
                imageUrl: clinic.photo.toBackendImage,
                height: 17.h,
              ),
            ),
            Flexible(
              flex: 0,
              child: Text(
                clinic.name,
                style: const TextStyle(
                  color: InUseColors.componentsColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
