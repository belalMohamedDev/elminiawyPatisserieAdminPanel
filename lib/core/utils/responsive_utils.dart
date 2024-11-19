import 'package:flutter/material.dart';

class ResponsiveUtils {
  final BuildContext context;

  ResponsiveUtils(this.context);

  /// Get the screen width
  double get screenWidth => MediaQuery.of(context).size.width;

  /// Get the screen height
  double get screenHeight => MediaQuery.of(context).size.height;

  /// Get the block size width (used for responsive scaling)
  double get blockSizeWidth => screenWidth / 100;

  /// Get the block size height (used for responsive scaling)
  double get blockSizeHeight => screenHeight / 100;

  /// Adjust the text size based on the device's screen size.
  double setTextSize(double size) {
    return (size * blockSizeWidth).clamp(10.0, 24.0); // Limit the range for web
  }

  /// Adjust the icon size based on the device's screen size.
  double setIconSize(double size) {
    return (size * blockSizeWidth).clamp(16.0, 48.0); // Limit the range for web
  }

  /// Adjust the width for responsive design.
  double setWidth(double width) {
    return (width * blockSizeWidth);
  }

  /// Adjust the height for responsive design.
  double setHeight(double height) {
    return (height * blockSizeHeight);
  }

  /// Adjust padding using block size.
  EdgeInsetsGeometry setPadding({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: setWidth(left ?? 0),
      top: setHeight(top ?? 0),
      right: setWidth(right ?? 0),
      bottom: setHeight(bottom ?? 0),
    );
  }

  /// Adjust margin using block size.
  EdgeInsetsGeometry setMargin({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: setWidth(left ?? 0),
      top: setHeight(top ?? 0),
      right: setWidth(right ?? 0),
      bottom: setHeight(bottom ?? 0),
    );
  }

  /// Adjust border radius based on the device's screen size.
  double setBorderRadius(double radius) {
    return (radius * blockSizeWidth)
        .clamp(4.0, 50.0); // Reasonable limits for web
  }

  /// Create a SizedBox with a specified height or width.
  SizedBox setSizeBox({double? width, double? height}) {
    return SizedBox(
      width: width != null ? setWidth(width) : null,
      height: height != null ? setHeight(height) : null,
    );
  }

  /// Responsive scale for web with a fallback for very large screens
  double responsiveScale() {
    if (screenWidth > 1200) {
      return 1.5; // For very large screens
    } else if (screenWidth > 800) {
      return 1.2; // For medium screens
    }
    return 1.0; // For small screens
  }
}
