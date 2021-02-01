import 'package:climate_flutter_app/services/networkHelper.dart';
import 'package:climate_flutter_app/utilities/weatherDataModel.dart';
import 'package:climate_flutter_app/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

class FetchWeatherData{
  Position position;
  FetchWeatherData(position){
    this.position = position;
  }
  String url;
    Future<WeatherDataModel> getWeatherData() async {
    WeatherDataModel weatherData;
    try {
    url = getUrl();
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var data =  networkHelper.getResponse();
    var d  =  json.decode(data.toString());
    //weatherData = WeatherDataModel.fromJson(d);
    print(weatherData);
    } catch (e) {
      print(e);
    }
    return weatherData;
  }

  String getUrl() {
      String lat = position.latitude.toString();
      String long = position.longitude.toString();
      String  mUrl = BaseUrl +
          'lat=${lat}&lon=${long}&units=metric&appid=' + ApiKey;
      print(mUrl);
      return mUrl;
  }

}