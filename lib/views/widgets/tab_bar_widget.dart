import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_color.dart';
import '../../core/app_size.dart';
import '../../core/app_style.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF413170),
            Color(0xFF372F64),
            Color(0xFF2E2651),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          kHeight5,
          Container(
            height: 5.h,
            width: 48.w,
            decoration: const BoxDecoration(
              color: Color(0xFF341F52),
            ),
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Hourly Forecast',
                style: AppStyle.tabStyle,
              ),
              Text(
                'Weekly Forecast',
                style: AppStyle.tabStyle,
              ),
            ],
          ),
          DividerTheme(
            data: const DividerThemeData(
              color: Color.fromARGB(255, 84, 73, 147),
            ),
            child: Divider(
              thickness: 1.sp,
            ),
          ),
        ],
      ),
    );
  }
}
