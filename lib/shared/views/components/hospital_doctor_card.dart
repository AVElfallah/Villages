import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/extension/string_extension.dart';
import 'package:villages/model/doctors/h_doctor.dart';
import 'package:villages/shared/views/layouts/make_apointment/make_apointment_page.dart';

import '../../../assets/colors.dart';

class HospitalDoctorCard extends StatelessWidget {
  const HospitalDoctorCard({
    Key? key,
    this.doctor,
    this.onTap,
  }) : super(key: key);
  final HDoctor? doctor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      margin: const EdgeInsets.all(
        25,
      ),
      padding: const EdgeInsets.all(
        10,
      ),
      decoration: BoxDecoration(
        color: InUseColors.appBarColor,
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "د/${doctor?.name!}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: InUseColors.componentsColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  doctor!.clinicName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: InUseColors.componentsColor,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      doctor!.rateAvg.toString() == "NaN"
                          ? "0"
                          : doctor!.rateAvg.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: InUseColors.componentsColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onTap ??
                      () {
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
          ),
          Flexible(
              child: CachedNetworkImage(
            imageUrl: doctor!.photo!.toBackendImage,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )),
        ],
      ),
    );
  }
}
