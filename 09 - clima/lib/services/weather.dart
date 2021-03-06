import 'package:clima/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'b6907d289e10d714a6e88b30761fae22';

class WeatherModel {
  Future<dynamic> getCityWeather(String city) async {
    city = 'London,uk';
    NetworkHelper networkHelper = NetworkHelper(
        "https://samples.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric");

    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    LocationManager lm = LocationManager();

    await lm.getCurrentLocation();

    int latitude = 35; //lm.latitude;
    int longitude = 139; //lm.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        "https://samples.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");

    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
