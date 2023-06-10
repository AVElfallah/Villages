import 'package:flutter/material.dart';

import '../../../assets/colors.dart';

class HelpCardWidget extends StatelessWidget {
  const HelpCardWidget({
    Key? key,
    this.title,
    this.onTap,
    this.icon,
    this.firstIcon,
  }) : super(key: key);
  final String? title;
  final void Function()? onTap;
  final IconData? icon, firstIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: InUseColors.componentsColor)),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        onTap: onTap ?? () {},
        tileColor: InUseColors.appBarColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        title: Row(
          children: [
            Icon(
              firstIcon,
              color: Colors.green,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title ?? 'no title',
              style: const TextStyle(
                color: InUseColors.componentsColor,
              ),
            ),
          ],
        ),
        trailing: Icon(
          icon ?? Icons.abc,
          color: Colors.green,
        ),
      ),
    );
  }
}
