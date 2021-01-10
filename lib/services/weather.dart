import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

import 'networking.dart';
import 'networking.dart';

const apiKey = 'bb5987cbbd427ef2a24c9789b1907c8a';
const openMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩️️  ';
    } else if (condition < 400) {
      return '🌧 ';
    } else if (condition < 600) {
      return '☔ ';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp < 10)
      return 'You\'ll need 🧣 and 🧤';
    else if (temp >= 10 && temp < 20) {
      return 'Bring a 🧥 with you';
    }
    else if (temp >= 20 && temp < 25) {
      return 'You\'ll need a 🌂 today';
    }
    else if (temp >= 25) {
      return 'It\'s 🍦 time';
    }
  }
}
