import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_color.dart';
import '../../core/app_size.dart';
import '../../core/app_style.dart';

class AirQualityContainerWidget extends StatelessWidget {
  const AirQualityContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        width: 345.w,
        height: 160.h,
        decoration: ShapeDecoration(
          color: const Color(0xFF2C235A),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.50.h,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: const Color(0xFF711793),
            ),
            borderRadius: BorderRadius.circular(22.sp),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 345.w,
              height: 160.h,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 15.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.hexagon,
                          color: Color(0x99EBEBF5),
                        ),
                        kWidth5,
                        Text(
                          'AIR QUALITY',
                          style: AppStyle.tabStyle,
                        )
                      ],
                    ),
                    kHeight15,
                    Text(
                      '3 - Low Health Risk',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.38.sp,
                      ),
                    ),
                    kHeight15,
                    Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF3B59B3),
                                Color(0xFF7A59CE),
                                Color(0xFFA059DE),
                                Color(0xFFC656DF),
                                Color(0xFFD34EC1),
                                Color(0xFFE3459E),
                              ],
                            ),
                          ),
                          child: const LinearProgressIndicator(
                            backgroundColor: Colors.transparent,
                            value: 0,
                            color: Color(0xFF3B59B3),
                          ),
                        ),
                        Positioned.fill(
                          top: -0.5.sp,
                          left: 40.sp,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.circle,
                              size: 4.5.sp,
                              color: AppColor.kWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                    kHeight15,
                    const Divider(
                      thickness: 2,
                    ),
                    kHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'See more',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColor.kWhite,
                            fontFamily: 'SF Pro Display',
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18.sp,
                          color: const Color(0x99EBEBF5),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
