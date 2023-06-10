import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../shared/data/api/rate_aworker_ecternal.dart';

class AppDialogs {
  static showRationgDialog(
      String Function(int, double) func, int? id, BuildContext context,
      {String? title}) {
    showDialog(
      context: context,
      builder: (ctx) {
        double initialRating = 3;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? 'قيم الخدمة',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            Center(
              child: RatingBar(
                initialRating: initialRating,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  half: Icon(
                    Icons.star_half,
                    color: Colors.amber.shade300,
                  ),
                  empty: Icon(
                    Icons.star_border_outlined,
                    color: Colors.amber.shade100,
                  ),
                ),
                itemPadding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                onRatingUpdate: (rating) {
                  initialRating = rating;
                  print(rating);
                },
              ),
            ),
            TextButton.icon(
              onPressed: () async {
                var res = await RateAWorkerExternal.i.rateAWorker(
                  func.call(
                    id!,
                    initialRating,
                  ),
                );
                if (res) Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.save,
                size: 30,
              ),
              label: const Text(
                'حفظ التقييم',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.amber,
              ),
            )
          ],
        );
      },
    );
  }
}
