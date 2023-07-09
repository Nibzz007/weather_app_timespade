import 'package:get/get.dart';
import 'package:weather_app_timespade/models/weather_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_timespade/services/api_service.dart';

class GlobalController extends GetxController {
  // create various variables
  final RxBool isLoading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final RxInt currentIndex = 0.obs;

  // create instance for each variable
  RxBool checkLoading() => isLoading;
  RxDouble getlatitude() => latitude;
  RxDouble getlongitude() => longitude;

  final weatherData = WeatherData().obs;
  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    // getting the currentposition
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update our lattitude and longitude
      latitude.value = value.latitude;
      longitude.value = value.longitude;
      // calling our weather api
      return ApiService()
          .getData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return currentIndex;
  }
}
