import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/assets.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/model/emergency.dart';
import 'package:villages/shared/views/components/show_telphone.dart';

class EmergencyCard extends StatelessWidget {
  const EmergencyCard({Key? key, this.emergency}) : super(key: key);
  final EmergencyModel? emergency;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        openTelephoneDialog(context, emergency!.phoneNumber!, 'الطوارئ');
      },
      child: Container(
        height: 22.h,
        padding: const EdgeInsets.all(
          12,
        ),
        margin: const EdgeInsets.all(
          20,
        ),
        decoration: BoxDecoration(
          color: InUseColors.appBarColor,
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      emergency!.adress!,
                      style: const TextStyle(
                        color: InUseColors.componentsColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Icon(
                      Icons.location_on_outlined,
                      color: InUseColors.componentsColor,
                      size: 30,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      emergency!.phoneNumber!,
                      style: const TextStyle(
                        color: InUseColors.componentsColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Icon(
                      Icons.phone,
                      color: InUseColors.componentsColor,
                      size: 27,
                    ),
                  ],
                ),
                Text(
                  emergency!.workTime!,
                  style: const TextStyle(
                    color: InUseColors.componentsColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      emergency!.rating.toString(),
                      style: const TextStyle(
                        color: InUseColors.componentsColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  child: Image.asset(
                    Assets.emergencyCall,
                    height: 30.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
