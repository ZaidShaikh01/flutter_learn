import 'package:flutter/material.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  // Value for the switch button
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Theme mode",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              // This is the switch san dit is used to switch between things
              Switch(
                  value: isChecked,
                  onChanged: (value) {
                    isChecked = value;
                    setState(() {});
                  }),
              SizedBox(
                width: 10,
              ),
              Text(isChecked ? "Dark Mode" : "Light Mode"),
            ],
          )
        ],
      ),
    );
  }
}
