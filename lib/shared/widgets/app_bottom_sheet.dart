import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profinder/shared/extensions/context_extensions.dart';
import '../theme/app_colors.dart';

class AppBottomSheet {
  static showModelBottomSheet({
    required BuildContext context,
    required Widget child,
    AnimationController? transitionController,
    double? height,
    double topPadding = 30,
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
  }) async {
    await showModalBottomSheet(
      context: context,
      transitionAnimationController: transitionController,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: height ?? context.height * .8,
        minWidth: 0.0,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          width: context.width,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 6.h,
                      bottom: topPadding,
                    ),
                    child: Container(
                      height: 5.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                child,
              ],
            ),
          ),
        );
      },
    );
  }
}
