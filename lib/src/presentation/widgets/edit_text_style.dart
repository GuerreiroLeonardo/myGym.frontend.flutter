// ignore: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:my_gym_coach/src/presentation/widgets/AppWidget.dart';
import 'package:my_gym_coach/src/utils/constants/app-colors.dart';
import 'package:my_gym_coach/src/utils/constants/general.dart';

// ignore: non_constant_identifier_names
Container EditTextStyle(var hintText, {isPassword = false}) {
  return Container(
    decoration: boxDecoration(radius: 12, showShadow: true, bgColor: t6white),
    child: TextFormField(
      style: const TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(26, 18, 4, 18),
        hintText: hintText,
        filled: true,
        fillColor: t6white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: t6white, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: t6white, width: 0.0),
        ),
      ),
    ),
  );
}
