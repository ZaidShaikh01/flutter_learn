import 'package:flutter/material.dart';
import 'package:funfact_app/providers/theme_provider.dart';
import 'package:funfact_app/widgets/theme_switcher.dart';
import 'package:provider/provider.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Settings"),
        ),
        body: Column(
          children: [
            ThemeSwitcher(),
            // ElevatedButton(
            //     onPressed: () {
            //       // Change the global state value with on press of global value button
            //       // themeProvider.updateStringData(data: "Hello");
            //     },
            //     child: Text("Update Global value")),

            //   // ? this code right here is to just demonstrate how provider can change the global set values.
            // // Text(
            // //   themeProvider.dataToUpadte,
            // // )
          ],
        ));
  }
}
