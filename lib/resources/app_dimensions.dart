import 'package:flutter/material.dart';

import '../core_utils/screenutil.dart';

class AppDimensions {
  static EdgeInsets appBarForEnLanguage = EdgeInsets.only(left: 16.0.toWidth);
  static EdgeInsets leadingHeadingRightPadding =
      EdgeInsets.only(right: 12.0.toWidth);
  static EdgeInsets leadingHeadingLeftPadding =
      EdgeInsets.only(left: 12.0.toWidth);

  ///
  /// All Padding
  ///
  static EdgeInsets all0 = EdgeInsets.all(0.toWidth);

  ///
  /// Top Paddings
  ///
  static final top2_65Padding = EdgeInsets.only(top: 2.65.toHeight);

  ///
  /// Left
  ///
  static final left8Padding = EdgeInsets.only(left: 8.toWidth);

  ///
  /// Right
  ///
  static final right2Padding = EdgeInsets.only(right: 2.toWidth);

  ///
  /// Bottom Paddings
  ///

  static final bottom80Padding = EdgeInsets.only(bottom: 80.toHeight);

  ///
  /// Horizontal Padding
  ///
  static final horizontal0Padding = EdgeInsets.symmetric(horizontal: 0.toWidth);

  ///
  /// Horizontal Top Padding
  ///
  static final horizontal12top5Padding =
      EdgeInsets.only(top: 5.toHeight, left: 12.toWidth, right: 12.toWidth);

  ///
  /// Symmetric
  ///
  static final horizontal2vertical10Padding =
      EdgeInsets.symmetric(horizontal: 2.toWidth, vertical: 10.0.toHeight);

  ///
  /// top Right
  ///
  static final top3Right12 =
      EdgeInsets.only(top: 3.toHeight, right: 12.toWidth);

  ///
  /// Top left
  ///
  static final top3Left12 = EdgeInsets.only(top: 3.toHeight, left: 12.toWidth);

  ///
  /// Top Bottom
  ///

  static final top8bottom16 =
      EdgeInsets.only(top: 8.toHeight, bottom: 16.toHeight);

  ///
  /// Vertical
  ///
  static final vertical15Padding = EdgeInsets.symmetric(
    vertical: 15.0.toHeight,
  );

  ///
  /// Top and Horizontal
  ///
  static final top26Horizontal16 =
      EdgeInsets.only(left: 16.toWidth, right: 16.toWidth, top: 26.toHeight);

  ///
  /// dyanmic
  ///
  static final top8all16 = EdgeInsets.only(
      top: 8.toHeight,
      bottom: 16.toHeight,
      left: 16.toWidth,
      right: 16.toWidth);
  static final top34Bottom33left20 = EdgeInsets.only(
    left: 20.toWidth,
    top: 34.toHeight,
    bottom: 33.toHeight,
  );
}
