import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app_timespade/controller/global_controller.dart';
import 'package:weather_app_timespade/models/weather_data_current.dart';
import '../../core/app_color.dart';
import '../../core/app_style.dart';
import 'package:geocoding/geocoding.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
    required this.height,
    required this.weatherDataCurrent,
  });

  final double height;
  final WeatherDataCurrent weatherDataCurrent;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';
  String temp = '';

  final GlobalController globalController = Get.put(GlobalController());
  @override
  void initState() {
    getAddress(globalController.getlatitude().value,
        globalController.getlongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.backGroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            city,
            style: AppStyle.headStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.weatherDataCurrent.current.temp!.toInt()}° ",
                style: AppStyle.subHeadStyle,
              ),
              Text(
                '|',
                style: AppStyle.subHeadStyle,
              ),
              Text(
                " ${widget.weatherDataCurrent.current.weather![0].description}",
                style: AppStyle.subHeadStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
