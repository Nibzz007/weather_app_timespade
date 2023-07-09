import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_timespade/models/weather_data_current.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../core/app_size.dart';
import '../../core/app_style.dart';

class RainfallWidget extends StatelessWidget {
  const RainfallWidget({
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
          horizontal: 13.h,
          vertical: 13.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BoxedIcon(
                  WeatherIcons.raindrop,
                  color: const Color(0x99EBEBF5),
                  size: 17.sp,
                ),
                Text(
                  'RAINFALL',
                  style: AppStyle.tabStyle,
                ),
              ],
            ),
            kHeight20,
            Text(
              '1.88 mm',
              style: AppStyle.rainfallHeadStyle,
            ),
            kHeight10,
            Expanded(
              child: Text(
                'in last hour',
                style: AppStyle.rainfallSubHeadStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
