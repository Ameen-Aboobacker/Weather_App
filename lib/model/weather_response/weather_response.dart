import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherResponse({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return _$WeatherResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
@JsonSerializable()
class Clouds {
  int? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return _$CloudsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}
@JsonSerializable()
class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}
@JsonSerializable()
class Main {
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  @JsonKey(name: 'temp_min')
  double? tempMin;
  @JsonKey(name: 'temp_max')
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
@JsonSerializable()
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
@JsonSerializable()
class Wind {
  double? speed;
  int? deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}