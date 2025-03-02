import 'package:flutter/material.dart';
import 'package:funfact_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  // Value for the switch button
  //  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var themeProvide = Provider.of<ThemeProvider>(context);

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
                  value: themeProvide.isDarkModeChanged,
                  onChanged: (value) {
                    // This will change the value of isChanged variable
                    themeProvide.isDarkModeChanged = value;

                    themeProvide.updateMode(darkMode: value);

                    //? we can remove this one as we don't need the thing cuz we are using th eglobal state
                    setState(() {});
                  }),
              SizedBox(
                width: 10,
              ),
              Text(themeProvide.isDarkModeChanged ? "Dark Mode" : "Light Mode"),
            ],
          )
        ],
      ),
    );
  }
}
