import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app_timespade/controller/global_controller.dart';
import 'package:weather_app_timespade/core/app_size.dart';
import 'package:weather_app_timespade/views/widgets/air_quality_container_widget.dart';
import 'package:weather_app_timespade/views/widgets/header_widget.dart';
import 'package:weather_app_timespade/views/widgets/horizontal_list_widget.dart';
import 'package:weather_app_timespade/views/widgets/rainfall_widget.dart';
import 'package:weather_app_timespade/views/widgets/sunrise_widget.dart';
import 'package:weather_app_timespade/views/widgets/tab_bar_widget.dart';
import 'package:weather_app_timespade/views/widgets/uv_index_widget.dart';
import 'package:weather_app_timespade/views/widgets/wind_widget.dart';
import '../core/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                )
              : Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF413170),
                        Color(0xFF372F64),
                        Color(0xFF2E2651),
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HeaderWidget(
                          height: height,
                          weatherDataCurrent:
                              globalController.getData().getCurrentWeather(),
                        ),
                        kHeight10,
                        TabbarWidget(height: height),
                        kHeight20,
                        HorizontalListWidget(
                          weatherDataHourly: globalController.getData().hourly!,
                        ),
                        kHeight20,
                        const AirQualityContainerWidget(),
                        kHeight10,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              UvIndexWidget(
                                weatherDataCurrent:
                                    globalController.getData().current!,
                              ),
                              kWidth20,
                              SunriseWidget(
                                weatherDataCurrent:
                                    globalController.getData().current!,
                              ),
                            ],
                          ),
                        ),
                        kHeight15,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              WindWidget(
                                weatherDataCurrent:
                                    globalController.getData().current!,
                              ),
                              kWidth20,
                              RainfallWidget(
                                weatherDataCurrent:
                                    globalController.getData().current!,
                              ),
                            ],
                          ),
                        ),
                        kHeight20,
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
