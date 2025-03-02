import 'package:flutter/material.dart';
import 'package:funfact_app/widgets/theme_switcher.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: Column(children: [ThemeSwitcher(),
      ElevatedButton(onPressed: (){}, child: Text("Update Global value"))],)
    );
  }
}