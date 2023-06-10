import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/extension/dialogs.dart';
import 'package:villages/extension/string_extension.dart';
import 'package:villages/model/workers.dart';
import 'package:villages/shared/constants/constant.dart';
import 'package:villages/shared/views/components/show_telphone.dart';
import '../../../assets/assets.dart';
import '../../../assets/colors.dart';

import '../layouts/make_apointment/make_apointment_page.dart';

class WorkerCard extends StatelessWidget {
  const WorkerCard({
    Key? key,
    this.worker,
    this.onTap,
  }) : super(key: key);
  final WorkerModel? worker;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );

    return InkWell(
      onTap: () {
        AppDialogs.showRationgDialog(
          rateWorkerAPI,
          worker!.id!,
          context,
        );
        // openTelephoneDialog(context, worker!.phone!, worker!.name!);
      },
      child: Container(
        margin: const EdgeInsets.all(
          15,
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
        height: 25.h,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: InUseColors.appBarColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 1.5,
                      ),
                    ),
                    height: 120,
                    width: 120,
                    child: worker!.photo != null
                        ? CachedNetworkImage(
                            imageUrl: worker!.photo!.toBackendImage,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )
                        : Image.asset(
                            Assets.elctWorker,
                          ),
                  ),
                  Row(
                    children: [
                      Text(
                        worker!.rate!.toString(),
                        style: const TextStyle(
                          color: InUseColors.componentsColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      )
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline_outlined,
                        color: InUseColors.componentsColor,
                        size: 30,
                      ),
                      Text(
                        worker!.name!,
                        textDirection: TextDirection.rtl,
                        style: textStyle,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      openTelephoneDialog(
                          context, worker!.phone!, worker!.name!);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: InUseColors.componentsColor,
                          size: 30,
                        ),
                        Text(
                          worker!.phone!,
                          textDirection: TextDirection.rtl,
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: InUseColors.componentsColor,
                        size: 30,
                      ),
                      Text(
                        worker!.address!,
                        textDirection: TextDirection.rtl,
                        style: textStyle,
                      ),
                    ],
                  ),
                  Text(
                    worker!.workTime!,
                    style: textStyle,
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
                      'اطلب',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
