import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profinder/shared/extensions/context_extensions.dart';

class AppDialog {
  static showDialog({
    required BuildContext context,
    required Widget child,
    double height = 350,
    double width = 320,
    bool barrierDismissible = true,
    String barrierLabel = "PROFINDER",
    Color barrierColor = Colors.black,
    Alignment alignment = Alignment.center,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    showGeneralDialog(
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: alignment,
          child: Padding(
            padding: padding,
            child: Container(
              height: height.h,
              width: width.w,
              // padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: context.theme.scaffoldBackgroundColor,
                child: child,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  static showPageDialog({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
    String barrierLabel = "FRIMOT",
    Duration duration = const Duration(milliseconds: 500),
  }) {
    showGeneralDialog(
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      //barrierColor: context.theme.scaffoldBackgroundColor,
      transitionDuration: duration,
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return child;
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }
}
