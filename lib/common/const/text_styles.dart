import 'package:flutter/material.dart';

import 'colors.dart';

class MyTextStyle {
  static const _letterSpacingPercentage = -4; // 자간 백분률 -4%
  static const letterSpacing = -1.025;
  static const height = 1.2;
  static const basicColor = MyColor.text;

  // 자간을 백분율에 따라 계산하는 함수
  static double _calculateLetterSpacing(double fontSize) {
    return fontSize * (_letterSpacingPercentage / 100);
  }

  // 텍스트 높이 계산하는 함수
  static double _calculateHeight(double fontSize) {
    return (fontSize + 6.0) / fontSize;
  }

  // 텍스트 높이 원상 복구 함수
  static double rollBackHeight(double fontSize) {
    return fontSize / (fontSize + 6.0);
  }

  // app name 32
  static final appName32B = TextStyle(
    fontSize: _appName32BFontSize,
    fontWeight: FontWeight.w600,
    letterSpacing: _calculateLetterSpacing(_appName32BFontSize),
    height: _calculateHeight(_appName32BFontSize),
    color: basicColor,
  );
  static const _appName32BFontSize = 32.0;

  // headline 24
  static final headline24Black = TextStyle(
    fontSize: _headlineFontSize,
    fontWeight: FontWeight.w900,
    letterSpacing: _calculateLetterSpacing(_headlineFontSize),
    height: _calculateHeight(_headlineFontSize),
    color: basicColor,
  );
  static final headline24B = TextStyle(
    fontSize: _headlineFontSize,
    fontWeight: FontWeight.w600,
    letterSpacing: _calculateLetterSpacing(_headlineFontSize),
    height: _calculateHeight(_headlineFontSize),
    color: basicColor,
  );
  static final headline24M = TextStyle(
    fontSize: _headlineFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: _calculateLetterSpacing(_headlineFontSize),
    height: _calculateHeight(_headlineFontSize),
    color: basicColor,
  );
  static final headline24R = TextStyle(
    fontSize: _headlineFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: _calculateLetterSpacing(_headlineFontSize),
    height: _calculateHeight(_headlineFontSize),
    color: basicColor,
  );
  static const _headlineFontSize = 24.0;

  // title 20
  static final title20B = TextStyle(
    fontSize: _titleFontSize,
    fontWeight: FontWeight.w600,
    letterSpacing: _calculateLetterSpacing(_titleFontSize),
    height: _calculateHeight(_titleFontSize),
    color: basicColor,
  );
  static final title20M = TextStyle(
    fontSize: _titleFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: _calculateLetterSpacing(_titleFontSize),
    height: _calculateHeight(_titleFontSize),
    color: basicColor,
  );
  static final title20R = TextStyle(
    fontSize: _titleFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: _calculateLetterSpacing(_titleFontSize),
    height: _calculateHeight(_titleFontSize),
    color: basicColor,
  );
  static const _titleFontSize = 20.0;

  // subtitle 18
  static final subtitle18B = TextStyle(
    fontSize: _subtitleFontSize,
    fontWeight: FontWeight.w600,
    letterSpacing: _calculateLetterSpacing(_subtitleFontSize),
    height: _calculateHeight(_subtitleFontSize),
    color: basicColor,
  );
  static final subtitle18M = TextStyle(
    fontSize: _subtitleFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: _calculateLetterSpacing(_subtitleFontSize),
    height: _calculateHeight(_subtitleFontSize),
    color: basicColor,
  );
  static final subtitle18R = TextStyle(
    fontSize: _subtitleFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: _calculateLetterSpacing(_subtitleFontSize),
    height: _calculateHeight(_subtitleFontSize),
    color: basicColor,
  );
  static const _subtitleFontSize = 18.0;

  // body 16
  static final body16B = TextStyle(
    fontSize: _bodyFontSize,
    fontWeight: FontWeight.w600,
    letterSpacing: _calculateLetterSpacing(_bodyFontSize),
    height: _calculateHeight(_bodyFontSize),
    color: basicColor,
  );
  static final body16M = TextStyle(
    fontSize: _bodyFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: _calculateLetterSpacing(_bodyFontSize),
    height: _calculateHeight(_bodyFontSize),
    color: basicColor,
  );
  static final body16R = TextStyle(
    fontSize: _bodyFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: _calculateLetterSpacing(_bodyFontSize),
    height: _calculateHeight(_bodyFontSize),
    color: basicColor,
  );
  static const _bodyFontSize = 16.0;

  // description 14
  static final description14B = TextStyle(
    fontSize: _descriptionFontSize,
    fontWeight: FontWeight.w600,
    letterSpacing: _calculateLetterSpacing(_descriptionFontSize),
    height: _calculateHeight(_descriptionFontSize),
    color: basicColor,
  );
  static final description14M = TextStyle(
    fontSize: _descriptionFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: _calculateLetterSpacing(_descriptionFontSize),
    height: _calculateHeight(_descriptionFontSize),
    color: basicColor,
  );
  static final description14R = TextStyle(
    fontSize: _descriptionFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: _calculateLetterSpacing(_descriptionFontSize),
    height: _calculateHeight(_descriptionFontSize),
    color: basicColor,
  );
  static const _descriptionFontSize = 14.0;

  // caption 12
  static final caption12R = TextStyle(
    fontSize: _captionFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: _calculateLetterSpacing(_captionFontSize),
    height: _calculateHeight(_captionFontSize),
    color: basicColor,
  );
  static const _captionFontSize = 12.0;
}
