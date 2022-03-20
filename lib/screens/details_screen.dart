// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.query}) : super(key: key);
  final String query;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var _weatherData;
  @override
  void initState() {
    super.initState();
    _weatherData = Weather_Services().fetch(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        centerTitle: true,
      ),
      body: FutureBuilder<WeatherModel>(
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                color: Colors.blue[100],
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data!.location!.name.toString().toUpperCase(),
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
                    ),
                    Text(snapshot.data!.location!.lat.toString() +
                        "°lat    " +
                        snapshot.data!.location!.lon.toString() +
                        "°lon"),
                    Text(
                      snapshot.data!.location!.region.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      snapshot.data!.location!.country.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 58),
                    Text(
                      "Temperature",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          snapshot.data!.current!.tempC.toString() + " °C",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          snapshot.data!.current!.tempF.toString() + " °F",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 58),
                    Text("Humidity : " +
                        snapshot.data!.current!.humidity.toString()),
                    Text("WindSpeed : " +
                        snapshot.data!.current!.windMph.toString() +
                        " mpH"),
                    Text("Condition : " +
                        snapshot.data!.current!.condition!.text.toString()),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
        future: _weatherData,
      ),
    );
  }
}
