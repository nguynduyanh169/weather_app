class WeatherDetailsModel {
  WeatherDetailsModel({
     this.lat,
     this.lon,
     this.timezone,
     this.timezoneOffset,
     this.current,
     this.minutely,
     this.hourly,
     this.daily,
  });
  late final dynamic lat;
  late final dynamic lon;
  late final String? timezone;
  late final dynamic timezoneOffset;
  late final Current? current;
  late final List<Minutely>? minutely;
  late final List<Hourly>? hourly;
  late final List<Daily>? daily;

  WeatherDetailsModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'] ?? 0.0;
    lon = json['lon'] ?? 0.0;
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'] ?? 0;
    current = Current.fromJson(json['current']);
    minutely =
        List.from(json['minutely']).map((e) => Minutely.fromJson(e)).toList();
    hourly = List.from(json['hourly']).map((e) => Hourly.fromJson(e)).toList();
    daily = List.from(json['daily']).map((e) => Daily.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['timezone'] = timezone;
    _data['timezone_offset'] = timezoneOffset;
    _data['current'] = current!.toJson();
    _data['minutely'] = minutely!.map((e) => e.toJson()).toList();
    _data['hourly'] = hourly!.map((e) => e.toJson()).toList();
    _data['daily'] = daily!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Current {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });
  late final dynamic dt;
  late final dynamic sunrise;
  late final dynamic sunset;
  late final dynamic temp;
  late final dynamic feelsLike;
  late final dynamic pressure;
  late final dynamic humidity;
  late final dynamic dewPoint;
  late final dynamic uvi;
  late final dynamic clouds;
  late final dynamic visibility;
  late final dynamic windSpeed;
  late final dynamic windDeg;
  late final List<Weather> weather;

  Current.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] ?? 0;
    sunrise = json['sunrise'] ?? 0;
    sunset = json['sunset'] ?? 0;
    temp = json['temp'] ?? 0.0;
    feelsLike = json['feels_like'] ?? 0.0;
    pressure = json['pressure'] ?? 0;
    humidity = json['humidity'] ?? 0;
    dewPoint = json['dew_point'] ?? 0.0;
    uvi = json['uvi'] ?? 0.0;
    clouds = json['clouds'] ?? 0;
    visibility = json['visibility'] ?? 0;
    windSpeed = json['wind_speed'] ?? 0;
    windDeg = json['wind_deg'] ?? 0.0;
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['uvi'] = uvi;
    _data['clouds'] = clouds;
    _data['visibility'] = visibility;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final dynamic id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Minutely {
  Minutely({
    required this.dt,
    required this.precipitation,
  });
  late final dynamic dt;
  late final dynamic precipitation;

  Minutely.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] ?? 0;
    precipitation = json['precipitation'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['precipitation'] = precipitation;
    return _data;
  }
}

class Hourly {
  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });
  late final dynamic dt;
  late final dynamic temp;
  late final dynamic feelsLike;
  late final dynamic pressure;
  late final dynamic humidity;
  late final dynamic dewPoint;
  late final dynamic uvi;
  late final dynamic clouds;
  late final dynamic visibility;
  late final dynamic windSpeed;
  late final dynamic windDeg;
  late final dynamic windGust;
  late final List<Weather> weather;
  late final dynamic pop;

  Hourly.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] ?? 0;
    temp = json['temp'] ?? 0.0;
    feelsLike = json['feels_like'] ?? 0.0;
    pressure = json['pressure'] ?? 0;
    humidity = json['humidity'] ?? 0;
    dewPoint = json['dew_point'] ?? 0.0;
    uvi = json['uvi'] ?? 0.0;
    clouds = json['clouds'] ?? 0;
    visibility = json['visibility'] ?? 0;
    windSpeed = json['wind_speed'] ?? 0.0;
    windDeg = json['wind_deg'] ?? 0;
    windGust = json['wind_gust'] ?? 0.0;
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    pop = json['pop'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['uvi'] = uvi;
    _data['clouds'] = clouds;
    _data['visibility'] = visibility;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['pop'] = pop;
    return _data;
  }
}

class Daily {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
  });
  late final dynamic dt;
  late final dynamic sunrise;
  late final dynamic sunset;
  late final dynamic moonrise;
  late final dynamic moonset;
  late final dynamic moonPhase;
  late final Temp temp;
  late final FeelsLike feelsLike;
  late final dynamic pressure;
  late final dynamic humidity;
  late final dynamic dewPoint;
  late final dynamic windSpeed;
  late final dynamic windDeg;
  late final dynamic windGust;
  late final List<Weather> weather;
  late final dynamic clouds;
  late final dynamic pop;
  late final dynamic uvi;

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] ?? 0;
    sunrise = json['sunrise'] ?? 0;
    sunset = json['sunset'] ?? 0;
    moonrise = json['moonrise'] ?? 0;
    moonset = json['moonset'] ?? 0;
    moonPhase = json['moon_phase'] ?? 0.0;
    temp = Temp.fromJson(json['temp']);
    feelsLike = FeelsLike.fromJson(json['feels_like']);
    pressure = json['pressure'] ?? 0;
    humidity = json['humidity'] ?? 0;
    dewPoint = json['dew_point'] ?? 0.0;
    windSpeed = json['wind_speed'] ?? 0;
    windDeg = json['wind_deg'] ?? 0;
    windGust = json['wind_gust'] ?? 0.0;
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    clouds = json['clouds'] ?? 0;
    pop = json['pop'] ?? 0;
    uvi = json['uvi'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['moonrise'] = moonrise;
    _data['moonset'] = moonset;
    _data['moon_phase'] = moonPhase;
    _data['temp'] = temp.toJson();
    _data['feels_like'] = feelsLike.toJson();
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['clouds'] = clouds;
    _data['pop'] = pop;
    _data['uvi'] = uvi;
    return _data;
  }
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });
  late final dynamic day;
  late final dynamic min;
  late final dynamic max;
  late final dynamic night;
  late final dynamic eve;
  late final dynamic morn;

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'] ?? 0.0;
    min = json['min'] ?? 0;
    max = json['max'] ?? 0.0;
    night = json['night'] ?? 0.0;
    eve = json['eve'] ?? 0.0;
    morn = json['morn'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['min'] = min;
    _data['max'] = max;
    _data['night'] = night;
    _data['eve'] = eve;
    _data['morn'] = morn;
    return _data;
  }
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });
  late final dynamic day;
  late final dynamic night;
  late final dynamic eve;
  late final dynamic morn;

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'] ?? 0.0;
    night = json['night'] ?? 0.0;
    eve = json['eve'] ?? 0.0;
    morn = json['morn'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['night'] = night;
    _data['eve'] = eve;
    _data['morn'] = morn;
    return _data;
  }
}
