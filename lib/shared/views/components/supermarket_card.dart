import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/assets.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/model/supermarket.dart';
import 'package:villages/shared/constants/constant.dart';

import '../../../extension/dialogs.dart';
import '../../../testwidg.dart';

class SupermarketCard extends StatelessWidget {
  const SupermarketCard({Key? key, required this.markets}) : super(key: key);
  final SupermarketModel? markets;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MapWebViewWidget(
              url: markets!.location!,
            ),
          ),
        );
      },
      onDoubleTap: () {
        AppDialogs.showRationgDialog(
          rateShopsAPI,
          markets!.id!,
          context,
        );
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 20.h,
          margin: const EdgeInsets.all(
            10,
          ),
          padding: const EdgeInsets.all(
            25,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 12.h,
                    height: 12.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(Assets.market),
                      ),
                      border: Border.all(
                        color: InUseColors.componentsColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    markets!.name!,
                    style: const TextStyle(
                      color: InUseColors.componentsColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 50.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        color: InUseColors.componentsColor,
                      ),
                      Text(
                        "انقر هنا",
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        markets!.rateAvg!.toInt().toString(),
                        style: const TextStyle(
                          color: InUseColors.componentsColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
