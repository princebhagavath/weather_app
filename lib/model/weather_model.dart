import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    this.location,
    this.current,
  });

  Location? location;
  Current? current;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
      };
}

class Current {
  Current({
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.humidity,
  });

  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;

  int? humidity;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: json["temp_c"],
        tempF: json["temp_f"].toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"].toDouble(),
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "humidity": humidity,
      };
}

class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });

  String? text;
  String? icon;
  int? code;

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}
