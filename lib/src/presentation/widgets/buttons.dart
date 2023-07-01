// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/utils/constants/app-colors.dart';
import 'package:flutter_clean_architecture/src/utils/constants/general.dart';
import 'package:flutter_clean_architecture/src/utils/widgets/AppWidget.dart';

class MainButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;

  MainButton({
    required this.textContent,
    required this.onPressed,
    this.isStroked = false,
  });

  @override
  MainButtonState createState() => MainButtonState();
}

class MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        alignment: Alignment.center,
        child: text(widget.textContent,
            textColor: widget.isStroked ? t6colorPrimary : t6white,
            isCentered: true,
            fontFamily: fontMedium,
            textAllCaps: true),
        decoration: widget.isStroked
            ? boxDecoration(bgColor: Colors.transparent, color: t6colorPrimary)
            : boxDecoration(bgColor: t6colorPrimary, radius: 12),
      ),
    );
  }
}
