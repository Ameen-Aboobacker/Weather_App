import 'package:flutter/material.dart';
import 'package:project/model/get_response.dart';
import 'package:project/model/weather_response/weather_response.dart';
import 'package:project/widgets/additional_info.dart';
import 'package:project/widgets/weather_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<WeatherResponse> myWeather;
  final TextEditingController locController = TextEditingController();
  String location = 'Delhi';
  @override
  void initState() {
    super.initState();
    setState(() {
      myWeather = getWeather(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Weather',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://img.freepik.com/premium-photo/blue-sky-with-clouds-closeup_87394-14404.jpg?w=360'),
          ),
        ),
        child: SafeArea(
          child: FutureBuilder<WeatherResponse>(
            future: myWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final name = snapshot.data!.name.toString();
                final tempf = snapshot.data!.main!.temp!;
                final temp = (tempf - 273.15).toStringAsFixed(2);
                final wind = snapshot.data!.wind!.speed;
                final pressure = snapshot.data!.main!.pressure;
                final description = snapshot.data!.weather![0].description;
                final humidity = snapshot.data!.main!.humidity;
                final lat = snapshot.data!.coord!.lat;
                final lon = snapshot.data!.coord!.lon;
        
                return Column(
                  children: [
                    WeatherWidget(
                      name: name,
                      temp: temp,
                      description: description,
                      humidity: humidity,
                    ),
                    const Text(
                      "Additional Information",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    AdditionalInfo(
                      wind: wind,
                      pressure: pressure,
                      longitude: lon,
                      latitude: lat,
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 500,
                //  color: Colors.black,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(fillColor: Colors.white),
                        controller: locController,
                      ),
                      const Text('Give location'),
                      ElevatedButton(
                          child: const Text('ok'),
                          onPressed: () {
                            setState(() {
                              location = locController.text;
                              myWeather = getWeather(location);
                            });

                            Navigator.pop(context);
                          }),
                    ],
                  ),
                );
              });
        },
        label: const Text('Give a location'),
        icon: const Icon(Icons.location_on),
      ),
    );
  }
}
