import 'package:flutter/material.dart';

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 360) {
    return width = MediaQuery.sizeOf(context).width * 0.6;
  }
  if (width < 390) {
    return width = MediaQuery.sizeOf(context).width * 0.58;
  } else {
    return width = MediaQuery.sizeOf(context).width * 0.53;
  }
}

double getHorizontalPadding(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  double horizontalPadding = 30.0;
  if (width < 362) {
    return horizontalPadding = 20.0;
  }
  if (width < 390) {
    return horizontalPadding = 25.0;
  } else {
    return horizontalPadding;
  }
}

double getRatingPadding(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  double horizontalPadding = 12.0;
  if (width < 376) {
    return horizontalPadding = 0.0;
  }
  if (width < 390) {
    return horizontalPadding = 8.0;
  } else {
    return horizontalPadding;
  }
}
