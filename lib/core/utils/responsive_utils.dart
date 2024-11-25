import 'package:flutter/material.dart';

class ResponsiveUtils {
  final BuildContext context;

  ResponsiveUtils(this.context);

  // Get the screen width and height
  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  // Define the screen category (mobile, tablet, desktop)
  String get screenCategory {
    if (screenWidth >= 1100) {
      return "desktop";
    } else if (screenWidth >= 850) {
      return "tablet";
    }
    return "mobile";
  }

  // Get block size (used for responsive scaling)
  double get blockSizeWidth => screenWidth / 100;
  double get blockSizeHeight => screenHeight / 100;

  // Adjust text size based on screen size
  double setTextSize(double size) {
    return (size * blockSizeWidth).clamp(10.0, 24.0); // Limit range for web
  }

  // Adjust icon size based on screen size
  double setIconSize(double size) {
    return (size * blockSizeWidth).clamp(16.0, 48.0); // Limit range for web
  }

  // Adjust padding for responsive design
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

  // Adjust margin for responsive design
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

  // Adjust border radius for responsive design
  double setBorderRadius(double radius) {
    return (radius * blockSizeWidth)
        .clamp(4.0, 50.0); // Reasonable limits for web
  }

  // Create a SizedBox with responsive size
  SizedBox setSizeBox({double? width, double? height, Widget? child}) {
    return SizedBox(
      width: width != null ? setWidth(width) : null,
      height: height != null ? setHeight(height) : null,
      child: child,
    );
  }

  // Adjust width for responsive design
  double setWidth(double width) {
    return (width * blockSizeWidth);
  }

  // Adjust height for responsive design
  double setHeight(double height) {
    return (height * blockSizeHeight);
  }

  // Responsive scale for very large screens
  double responsiveScale() {
    if (screenWidth > 1200) {
      return 1.5; // For very large screens
    } else if (screenWidth > 800) {
      return 1.2; // For medium screens
    }
    return 1.0; // For small screens
  }

  // Get responsive value based on the screen category
  T responsiveValue<T>({
    required T desktop,
    required T tablet,
    required T mobile,
  }) {
    switch (screenCategory) {
      case "desktop":
        return desktop;
      case "tablet":
        return tablet;
      default:
        return mobile;
    }
  }

  // Get responsive text size
  double responsiveTextSize({
    required double desktop,
    required double tablet,
    double? mobile,
  }) {
    return responsiveValue(desktop: desktop, tablet: tablet, mobile: mobile!);
  }

  // Get responsive padding
  EdgeInsets responsivePadding({
    required EdgeInsets desktop,
    required EdgeInsets tablet,
    required EdgeInsets mobile,
  }) {
    return responsiveValue(desktop: desktop, tablet: tablet, mobile: mobile);
  }
}

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? tabletAndDesktop;

  const Responsive({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.tabletAndDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtils utils = ResponsiveUtils(context);

    if ((utils.screenCategory == "desktop" ||
            utils.screenCategory == "tablet") &&
        tabletAndDesktop != null) {
      return tabletAndDesktop!;
    } else if (utils.screenCategory == "desktop" && desktop != null) {
      return desktop!;
    } else if (utils.screenCategory == "tablet" && tablet != null) {
      return tablet!;
    } else if (mobile != null) {
      return mobile!;
    } else {
      return const SizedBox.shrink();
    }
  }
}
