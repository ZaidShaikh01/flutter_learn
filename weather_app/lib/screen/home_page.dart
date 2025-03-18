import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/screen/additional_info_item.dart';
import 'package:weather_app/screen/hourly_forecaste_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/screen/secrets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // we can use is loading or simply we can use futurebuilder
  // Now I want to get the Loading thing
  bool isLoading = false;
  // This variable here is to get the temp value
  double temp = 0;
  double windSpeed = 0;
  // humidity & pressure is also needed
  int pressure = 0;
  int humidity = 0;
  Future getCurrentWeather() async {
    // Might get an issue so we need to catch it ... Always catch when you are dealing with API or internate request in ususal
    isLoading = true;
    try {
      String cityName = 'London';
      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$openWeatherAPIKey'),
      );
      // First of all we need to decode the response body
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw 'Unexpected error occured';
      }

      // We need to get the temperature but we need to wait so that data is retrived so,.. We have to wait
      temp = (data['list'][0]['main']['temp']);
      humidity = (data['list'][0]['main']['humidity']);
      pressure = (data['list'][0]['main']['pressure']);
      windSpeed = (data['list'][0]['wind']['speed']);
      isLoading = false;
      setState(() {});
    } catch (e) {
      // Add a snakbar widget

      throw e.toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Big card widget
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    '$temp \' K',
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Icon(
                                    Icons.cloud,
                                    size: 64,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Rain',
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // Weather forcast cards
                    const Text(
                      "Weather Forecast",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HourlyForeCasteItem(
                            icon: Icons.sunny,
                            time: '09:00',
                            tempreture: '301.17',
                          ),
                          HourlyForeCasteItem(
                            icon: Icons.cloud,
                            time: '10:00',
                            tempreture: '300.17',
                          ),
                          HourlyForeCasteItem(
                            icon: Icons.sunny,
                            time: '11:00',
                            tempreture: '300.12',
                          ),
                          HourlyForeCasteItem(
                            icon: Icons.cloud,
                            time: '12:00',
                            tempreture: '302.18',
                          ),
                          HourlyForeCasteItem(
                            icon: Icons.cloud,
                            time: '13:00',
                            tempreture: '303.13',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // Additionl cards
                    const Text(
                      "Additional Information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    // Making the humidity, Windspeed, Pressure cards

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Humidity
                        AdditionalInfoItem(
                          icon: Icons.water_drop,
                          label: 'Humidity',
                          value: '$humidity',
                        ),
                        // WindSpeed
                        AdditionalInfoItem(
                          icon: Icons.air,
                          label: 'Wind Speed',
                          value: '$windSpeed',
                        ),
                        // Pressure
                        AdditionalInfoItem(
                          icon: Icons.beach_access,
                          label: 'Pressure',
                          value: '$pressure',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
