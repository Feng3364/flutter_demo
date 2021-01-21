import 'package:flutter/material.dart';

/// 主题色
final Color AppThemeColor = Color.fromRGBO(220, 220, 220, 1.0);

/// 屏幕宽度
double ScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;

/// 屏幕高度
double ScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;
