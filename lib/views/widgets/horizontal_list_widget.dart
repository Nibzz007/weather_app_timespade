import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_timespade/models/weather_data_hourly.dart';

import '../../core/app_size.dart';

class HorizontalListWidget extends StatelessWidget {
  const HorizontalListWidget({
    super.key,
    required this.weatherDataHourly,
  });

  final WeatherDataHourly weatherDataHourly;
  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                    height: 160.h,
                    width: 70.w,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF473184),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50.w,
                          color: Colors.white.withOpacity(0.20000000298023224),
                        ),
                        borderRadius: BorderRadius.circular(30.sp),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 2,
                          offset: Offset(5, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 158.h,
                          width: 70.w,
                          padding: EdgeInsets.symmetric(
                            vertical: 5.h,
                          ),
                          decoration: ShapeDecoration(
                            color: const Color(0x3348319D),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50.w,
                                color: Colors.white
                                    .withOpacity(0.20000000298023224),
                              ),
                              borderRadius: BorderRadius.circular(30.sp),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 2,
                                offset: Offset(5, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                getTime(weatherDataHourly.hourly[index].dt!),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.50,
                                ),
                              ),
                              SizedBox(
                                width: 44.w,
                                height: 38.h,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 6.sp,
                                      top: -4.sp,
                                      child: SizedBox(
                                        width: 32.w,
                                        height: 32.h,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 32.w,
                                              height: 32.h,
                                              child: Image.asset(
                                                  "assets/weather/${weatherDataHourly.hourly[index].weather![0].icon!}.png",
                                                  height: 20.h,
                                                  width: 20.w),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "${weatherDataHourly.hourly[index].temp}°",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.38,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              },
              separatorBuilder: (context, index) {
                return kWidth15;
              },
              itemCount: weatherDataHourly.hourly.length > 12
                  ? 14
                  : weatherDataHourly.hourly.length,
            ),
          ),
        ],
      ),
    );
  }
}
