import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_timespade/models/weather_data_current.dart';
import '../../core/app_color.dart';
import '../../core/app_size.dart';
import '../../core/app_style.dart';

class UvIndexWidget extends StatelessWidget {
  const UvIndexWidget({
    super.key,
    required this.weatherDataCurrent,
  });

  final WeatherDataCurrent weatherDataCurrent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.w,
      height: 164.h,
      decoration: ShapeDecoration(
        color: const Color(0xFF2C235A),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50.w,
            color: Colors.deepPurple,
          ),
          borderRadius: BorderRadius.circular(22),
        ),
      ),
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
                  Icons.sunny,
                  color: Color(0x99EBEBF5),
                ),
                kWidth5,
                Text(
                  'UV INDEX',
                  style: AppStyle.tabStyle,
                ),
              ],
            ),
            kHeight10,
            Text(
              weatherDataCurrent.current.uvIndex.toString(),
              style: AppStyle.headStyle,
            ),
            Text(
              'Moderate',
              style: TextStyle(
                fontSize: 22.sp,
                color: AppColor.kWhite,
                fontFamily: 'SF Pro Display',
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
                  top: -0.5,
                  left: 0,
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
          ],
        ),
      ),
    );
  }
}
