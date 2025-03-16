import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/screen/additional_info_item.dart';
import 'package:weather_app/screen/hourly_forecaste_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: Center(
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
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              '300 \' K',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Icon(
                              Icons.cloud,
                              size: 64,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Rain',
                              style: TextStyle(
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

              SizedBox(
                height: 20,
              ),

              // Weather forcast cards
              const Text(
                "Weather Forecast",
                style: TextStyle(
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

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Humidity
                  AdditionalInfoItem(
                    icon: Icons.water_drop,
                    label: 'Humidity',
                    value: '91',
                  ),
                  // WindSpeed
                  AdditionalInfoItem(
                    icon: Icons.air,
                    label: 'Wind Speed',
                    value: '7.67',
                  ),
                  // Pressure
                  AdditionalInfoItem(
                    icon: Icons.beach_access,
                    label: 'Pressure',
                    value: '1000',
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
