import 'package:flutter/cupertino.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../utils/constants/app-colors.dart';

class Bar extends StatelessWidget {
  final double height;

  final int _baseDurationMs = 1000;
  final double _maxElementHeight = 100;

  Bar(this.height);

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder(
      duration: Duration(milliseconds: (height * _baseDurationMs).round()),
      tween: Tween(begin: 0.0, end: height),
      builder: (context, dynamic animatedHeight, child) {
        return Column(
          children: <Widget>[
            Container(
              height: (1 - animatedHeight) * _maxElementHeight,
            ),
            Container(
              width: 6,
              height: animatedHeight * _maxElementHeight,
              color: t6colorPrimary,
            ),
          ],
        );
      },
    );
  }
}
