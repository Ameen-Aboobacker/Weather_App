import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.name,
    required this.temp,
    required this.description,
    required this.humidity,
  });
  final String name;
  final String temp;
  final String? description;
  final int? humidity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(
            height: 10,
          ),
          const Icon(
            Icons.sunny,
            color: Colors.orange,
            size: 64.0,
          ),
          Text(
            '$temp°C',
            style: const TextStyle(
              fontSize: 46,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 85, 85, 85),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LimitedBox(
                maxWidth: 150,
                child: Text(
                  '$description',
                  
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 85, 85, 85),
                  ),
                ),
              ),
              Text(
                "Humidity $humidity %",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 85, 85, 85),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
