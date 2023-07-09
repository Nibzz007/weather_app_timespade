// instance for getting the api response
class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  int? temp;
  int? humidity;
  int? sunrise;
  int? sunset;
  int? clouds;
  double? uvIndex;
  double? feelsLike;
  double? windSpeed;
  List<Weather>? weather;
  Rain? rain;

  Current({
    this.temp,
    this.humidity,
    this.sunrise,
    this.sunset,
    this.feelsLike,
    this.clouds,
    this.uvIndex,
    this.windSpeed,
    this.weather,
    this.rain,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.round(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        humidity: json['humidity'] as int?,
        uvIndex: (json['uvi'] as num?)?.toDouble(),
        clouds: json['clouds'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        rain: json["rain"]?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        "sunrise": sunrise,
        "sunset": sunset,
        'uvi': uvIndex,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        "rain": rain,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Rain {
  double the1H;

  Rain({
    required this.the1H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H,
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  // from json
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
