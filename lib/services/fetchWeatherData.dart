import 'dart:convert';

import 'package:climate_flutter_app/services/networkHelper.dart';
import 'package:climate_flutter_app/utilities/constants.dart';
import 'package:climate_flutter_app/utilities/weatherDataModel.dart';
import 'package:geolocator/geolocator.dart';

class FetchWeatherData {
  Position position;

  String cityName;
  String temperature;
  String temperatureMin;
  String temperatureMax;
  String feelsLike;
  String humidity;
  String pressure;
  String seaLevel;

  FetchWeatherData(position) {
    this.position = position;
  }

  String url;

  Future<WeatherDataModel> getWeatherData() async {
    WeatherDataModel weatherData;
    try {
      url = getUrl();
      NetworkHelper networkHelper = NetworkHelper(url: url);
      var data = await networkHelper.getResponse();
      var d = json.decode(data);
      var temp = d['main']['temp'];
      //weatherData = WeatherDataModel.fromJson(d);
      print(temp);
    } catch (e) {
      print(e);
    }
    return weatherData;
  }

  String getUrl() {
    String lat = position.latitude.toString();
    String long = position.longitude.toString();
    String mUrl =
        BaseUrl + 'lat=${lat}&lon=${long}&units=metric&appid=' + ApiKey;
    print(mUrl);
    return mUrl;
  }
}
