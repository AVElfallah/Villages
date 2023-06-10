/* import 'package:flutter/material.dart';
import 'package:villages/model/hospital.dart';
import 'package:villages/shared/data/hospital_doctor.dart';
import 'package:villages/shared/views/layouts/hospital_doctors_preview/hospital_doctors_preview_page.dart';

import '../../assets/assets.dart';

class HospitalSpData {
  static List<HospitalModel> sp = [
    HospitalModel(
      name: "اوعية دموية",
      assetsUrl: Assets.bloodCuate,
      onTap: (ctx) {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (ctx) => HospitalDoctorsPreviewPage(
              title: "اوعية دموية",
              doctors: HospitalDoctorData.bloodDoctors,
            ),
          ),
        );
      },
    ),
    HospitalModel(
      name: "جراحة عامة",
      assetsUrl: Assets.surgeryRafiki,
      onTap: (ctx) {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (ctx) => HospitalDoctorsPreviewPage(
              title: "جراحة عامة",
              doctors: HospitalDoctorData.serguryDoctors,
            ),
          ),
        );
      },
    ),
    HospitalModel(
      name: "العظام",
      assetsUrl: Assets.bonesDoctor,
      onTap: (ctx) {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (ctx) => HospitalDoctorsPreviewPage(
              title: "العظام",
              doctors: HospitalDoctorData.bonesDoctors,
            ),
          ),
        );
      },
    ),
    HospitalModel(
      name: "الباطنة",
      assetsUrl: Assets.doctorCare,
      onTap: (ctx) {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (ctx) => HospitalDoctorsPreviewPage(
              title: "الباطنة",
              doctors: HospitalDoctorData.insiderDoctors,
            ),
          ),
        );
      },
    ),
    HospitalModel(
      name: "النسا و الولادة",
      assetsUrl: Assets.carePr,
      onTap: (ctx) {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (ctx) => HospitalDoctorsPreviewPage(
              title: "النسا و الولادة",
              doctors: HospitalDoctorData.womenDoctors,
            ),
          ),
        );
      },
    ),
    HospitalModel(
      name: "الاسنان",
      assetsUrl: Assets.tDoctor,
      onTap: (ctx) {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (ctx) => HospitalDoctorsPreviewPage(
              title: "الاسنان",
              doctors: HospitalDoctorData.teethDoctors,
            ),
          ),
        );
      },
    ),
    HospitalModel(
      name: "العلاج الطبيعي",
      assetsUrl: Assets.orthopedicCuate,
      onTap: (ctx) {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (ctx) => HospitalDoctorsPreviewPage(
              title: "العلاج الطبيعي",
              doctors: HospitalDoctorData.treatDoctors,
            ),
          ),
        );
      },
    ),
    HospitalModel(
      name: "الاطفال",
      assetsUrl: Assets.childCare,
      onTap: (ctx) {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (ctx) => HospitalDoctorsPreviewPage(
              title: "الاطفال",
              doctors: HospitalDoctorData.childDoctors,
            ),
          ),
        );
      },
    ),
  ];
}
 */