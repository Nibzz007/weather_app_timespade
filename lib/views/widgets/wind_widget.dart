import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_timespade/core/app_size.dart';
import 'package:weather_app_timespade/core/app_style.dart';
import 'package:weather_app_timespade/models/weather_data_current.dart';
import 'package:weather_icons/weather_icons.dart';

class WindWidget extends StatelessWidget {
  const WindWidget({
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
          horizontal: 13.w,
          vertical: 13.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BoxedIcon(
                  WeatherIcons.strong_wind,
                  color: Color(0x99EBEBF5),
                  size: 17.sp,
                ),
                kWidth5,
                Text(
                  'WIND',
                  style: AppStyle.tabStyle,
                ),
              ],
            ),
            kHeight20,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text(
                    "${weatherDataCurrent.current.windSpeed.toString()} km/h",
                    style: AppStyle.windHeadStyle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
