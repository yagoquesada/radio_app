import 'package:flutter/material.dart';
import 'package:radio_app/core/constants/colors.dart';

ElevatedButtonThemeData elevatedButtonThemeData = const ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(YColors.transparent),
    elevation: MaterialStatePropertyAll(0),
    foregroundColor: MaterialStatePropertyAll(YColors.white),
    shape: MaterialStatePropertyAll(CircleBorder()),
    padding: MaterialStatePropertyAll(EdgeInsets.all(2)),
  ),
);
