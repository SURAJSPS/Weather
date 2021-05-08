

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class LocationInfo {
  final double long;
  final double lat;

  LocationInfo({
    this.long,
    this.lat,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    final long = json['lon'];
    final lat = json['lat'];

    return LocationInfo(
      long: long,
      lat: lat,
    );
  }
}

class WindInfo {
  final double speed;
  final int deg;
   var gust;

  WindInfo({
    this.speed,
    this.deg,
    this.gust,
  });

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];
    final deg = json['deg'];
    final gust = json['gust'];

    return WindInfo(
      speed: speed,
      deg: deg,
      gust: gust,
    );
  }
}



class SunInfo {
  final String country;
  final int sunrise;
  final int sunset;

  SunInfo({
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SunInfo.fromJson(Map<String, dynamic> json) {
    final country = json['country'];
    final sunrise = json['sunrise'];
    final sunset = json['sunset'];

    return SunInfo(
      country: country,
      sunrise: sunrise,
      sunset: sunset,
    );
  }
}

class TemperatureInfo {
  final double temperature;
  final double temperatureFeels;
  final double temperatureMin;
  final double temperatureMax;
  final int pressure;
  final int humidity;

  TemperatureInfo({
    this.temperature,
    this.temperatureFeels,
    this.temperatureMin,
    this.temperatureMax,
    this.pressure,
    this.humidity,
  });

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    final temperatureFeels = json['feels_like'];
    final temperatureMin = json['temp_min'];
    final temperatureMax = json['temp_max'];
    final pressure = json['pressure'];
    final humidity = json['humidity'];

    return TemperatureInfo(
      temperature: temperature,
      temperatureFeels: temperatureFeels,
      temperatureMin: temperatureMin,
      temperatureMax: temperatureMax,
      pressure: pressure,
      humidity: humidity,
    );
  }
}

class WeatherResponse {
  final String cityName;
  final int visibility;
  final int timezone;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  final TemperatureInfo feelslikeInfo;
  final TemperatureInfo temperatureMinInfo;
  final TemperatureInfo temperatureMaxInfo;
  final TemperatureInfo pressureInfo;
  final TemperatureInfo humidityInfo;
  final LocationInfo longInfo;
  final LocationInfo latInfo;
  final WindInfo speedInfo;
  final WindInfo degInfo;
  final WindInfo gustInfo;
  final SunInfo countryInfo;
  final SunInfo sunriseInfo;
  final SunInfo sunsetInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({
    this.cityName,
    this.visibility,
    this.timezone,
    this.tempInfo,
    this.weatherInfo,
    this.feelslikeInfo,
    this.temperatureMinInfo,
    this.temperatureMaxInfo,
    this.pressureInfo,
    this.humidityInfo,
    this.longInfo,
    this.latInfo,
    this.speedInfo,
    this.gustInfo,
    this.degInfo,
    this.countryInfo,
    this.sunriseInfo,
    this.sunsetInfo,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final visibility = json['visibility'];
    final timezone = json['timezone'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final feelslikeInfoJson = json['main'];
    final feelslikeInfo = TemperatureInfo.fromJson(feelslikeInfoJson);

    final temperatureMinInfoJson = json['main'];
    final temperatureMinInfo = TemperatureInfo.fromJson(temperatureMinInfoJson);

    final temperatureMaxInfoJson = json['main'];
    final temperatureMaxInfo = TemperatureInfo.fromJson(temperatureMaxInfoJson);
    final pressureInfoJson = json['main'];
    final pressureInfo = TemperatureInfo.fromJson(pressureInfoJson);
    final humidityInfoJson = json['main'];
    final humidityInfo = TemperatureInfo.fromJson(humidityInfoJson);

    final longInfoJson = json['coord'];
    final longInfo = LocationInfo.fromJson(longInfoJson);

    final latInfoJson = json['coord'];
    final latInfo = LocationInfo.fromJson(latInfoJson);

    final speedInfoJson = json['wind'];
    final speedInfo = WindInfo.fromJson(speedInfoJson);

    final gustInfoJson = json['wind'];
    final gustInfo = WindInfo.fromJson(gustInfoJson);

    final degInfoJson = json['wind'];
    final degInfo = WindInfo.fromJson(degInfoJson);

    final countryInfoJson = json['sys'];
    final countryInfo = SunInfo.fromJson(countryInfoJson);

    final sunriseInfoJson = json['sys'];
    final sunriseInfo = SunInfo.fromJson(sunriseInfoJson);

    final sunsetInfoJson = json['sys'];
    final sunsetInfo = SunInfo.fromJson(sunsetInfoJson);

    return WeatherResponse(
      cityName: cityName,
      visibility: visibility,
      timezone: timezone,
      tempInfo: tempInfo,
      weatherInfo: weatherInfo,
      feelslikeInfo: feelslikeInfo,
      temperatureMinInfo: temperatureMinInfo,
      temperatureMaxInfo: temperatureMaxInfo,
      pressureInfo: pressureInfo,
      humidityInfo: humidityInfo,
      longInfo: longInfo,
      latInfo: latInfo,
      speedInfo: speedInfo,
      gustInfo: gustInfo,
      degInfo: degInfo,
      countryInfo: countryInfo,
      sunriseInfo: sunriseInfo,
      sunsetInfo: sunsetInfo,
    );
  }
}
