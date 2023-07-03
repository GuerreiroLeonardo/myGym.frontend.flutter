import 'package:flutter/material.dart';
import 'package:my_gym_coach/src/presentation/widgets/percent_indicator/circular_percent_indicator.dart';

import '../../utils/constants/app-colors.dart';
import '../../utils/constants/general.dart';

Column circleProgressDashboard(var text, var text1, var text2, var per) {
  return Column(
    children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text1,
            style: const TextStyle(
                color: t6colorPrimary, fontSize: textSizeSMedium),
          ),
          const SizedBox(
            width: 26,
          ),
          Text(
            text2,
            style: const TextStyle(color: t6white, fontSize: textSizeSMedium),
          ),
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      CircularPercentIndicator(
        radius: 100.0,
        lineWidth: 6.0,
        animation: true,
        percent: per,
        backgroundColor: t6white,
        circularStrokeCap: CircularStrokeCap.round,
        center: new Text(
          text,
          style: const TextStyle(fontSize: 20.0),
        ),
        progressColor: t6colorPrimary,
      )
    ],
  );
}
