import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_timespade/models/weather_data_current.dart';
import '../../core/app_size.dart';
import '../../core/app_style.dart';

class SunriseWidget extends StatelessWidget {
  const SunriseWidget({
    super.key,
    required this.weatherDataCurrent,
  });

  final WeatherDataCurrent weatherDataCurrent;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

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
                  Icons.sunny_snowing,
                  color: Color(0x99EBEBF5),
                ),
                kWidth5,
                Text(
                  'SUNRISE',
                  style: AppStyle.tabStyle,
                ),
              ],
            ),
            Text(
              getTime(weatherDataCurrent.current.sunrise),
              style: AppStyle.sunriseHeadStyle,
            ),
            kHeight20,
            Text(
              'SUNSET',
              style: AppStyle.sunsetHeadStyle,
            ),
            kHeight10,
            Text(
              getTime(weatherDataCurrent.current.sunset),
              style: AppStyle.sunsetStyle,
            )
          ],
        ),
      ),
    );
  }
}
