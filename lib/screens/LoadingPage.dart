import 'package:climate_flutter_app/services/fetchLocation.dart';
import 'package:climate_flutter_app/services/fetchWeatherData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:climate_flutter_app/utilities/weatherDataModel.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    fetchLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SpinKitFadingCube(
        color: Colors.white,
        size: 50,
      ),
    );
  }

  Future<http.Response> getWeatherData(Position position) async {
    final http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=e8fd4c337dfd075df2d16135a7d43661');
    if (response.statusCode == 200) {
      String data = response.body;
      var wheatherData = json.decode(data);
      print(wheatherData);
    } else {
      print(response.statusCode);
    }
  }

  void fetchLocationData() async {
    FetchLocation fetchLocation = new FetchLocation();
    Position position = await fetchLocation.getLocationData();
    print(position.latitude.toString());
    print(position.longitude.toString());
    fetchWeatherData(position);
  }

  void fetchWeatherData(Position position) async {
    FetchWeatherData fetchWeatherData = FetchWeatherData(position);
    WeatherDataModel weatherData = await fetchWeatherData.getWeatherData();
  }
}
