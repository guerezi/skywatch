import 'dart:ui';

import 'package:flutter/widgets.dart';

const defaultPagePadding = EdgeInsets.symmetric(vertical: 16, horizontal: 12);
const defaultPadding = EdgeInsets.symmetric(vertical: 8, horizontal: 6);
const defaultPaddingLarge = EdgeInsets.symmetric(vertical: 16, horizontal: 24);
const defaultBorderRadius = BorderRadius.all(Radius.circular(12));

bool get darkMode =>
    WidgetsBinding.instance.platformDispatcher.platformBrightness ==
    Brightness.dark;
