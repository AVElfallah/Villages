import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/model/doctors/doctor_clinc.dart';
import 'package:villages/model/hospital_doctor.dart';
import 'package:villages/views/spcial_doctors/components/appointment_card.dart';

import '../../../assets/assets.dart';
import '../../../assets/colors.dart';
import '../../../extension/dialogs.dart';
import '../../../shared/constants/constant.dart';
import '../../../shared/views/layouts/make_apointment/make_apointment_page.dart';

class SpcialDoctorCard extends StatelessWidget {
  const SpcialDoctorCard({
    Key? key,
    this.doctorClinic,
  }) : super(key: key);

  final DoctorClinic? doctorClinic;
  @override
  Widget build(BuildContext context) {
    var today = doctorClinic?.doctorDates!
        .firstWhere((element) => element.day == getDayNowName());
    var tomorrow = doctorClinic?.doctorDates!
        .firstWhere((element) => element.day == getDayTomorrowName());

    return InkWell(
      onDoubleTap: () {
        AppDialogs.showRationgDialog(
          rateClincDoctorAPI,
          doctorClinic!.id!,
          context,
        );
      },
      child: Container(
        height: 25.h,
        margin: const EdgeInsets.all(
          15,
        ),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: InUseColors.appBarColor,
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppointmentCard(
                day: 'غداً',
                isShortenText: true,
                text: tomorrow!.time!,
                isActive: tomorrow.off == 1,
                size: const Size(64, 130),
              ),
            ),
            AppointmentCard(
              day: 'اليوم',
              isShortenText: true,
              text: today!.time!,
              isActive: today.off == 1,
              size: const Size(64, 130),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'د/ ${doctorClinic!.name}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 35.w,
                  child: Text(
                    doctorClinic!.field.toString(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      doctorClinic!.getRate().toString(),
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MakeAppointmentPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                    ),
                    backgroundColor: InUseColors.submitIconColor,
                  ),
                  child: const Text(
                    'إحجز',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            const CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                Assets.doctorFace,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
