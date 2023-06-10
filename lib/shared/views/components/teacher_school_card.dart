import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/model/teacher.dart';
import 'package:villages/extension/string_extension.dart';
import '../../../assets/colors.dart';

class TeacherSchoolCard extends StatelessWidget {
  const TeacherSchoolCard({Key? key, this.teacher}) : super(key: key);
  final TeacherModel? teacher;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      margin: const EdgeInsets.all(
        20,
      ),
      padding: const EdgeInsets.all(
        5,
      ),
      decoration: BoxDecoration(
        color: InUseColors.appBarColor,
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "أ/${teacher!.name}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: InUseColors.componentsColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 50.w,
                  child: Text(
                    "المادة العلمية:${teacher!.subject}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: InUseColors.componentsColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  "${teacher!.stage}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: InUseColors.componentsColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${teacher!.rateAvge()}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: InUseColors.componentsColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(
                10,
              ),
              child: CachedNetworkImage(
                imageUrl: (teacher!.photo ?? '').toBackendImage,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
