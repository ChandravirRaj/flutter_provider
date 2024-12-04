import 'package:flutter/material.dart';
import 'package:flutter_provider/single_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangerScreen extends StatefulWidget {
  const ThemeChangerScreen({super.key});

  @override
  State<ThemeChangerScreen> createState() => _ThemeChangerScreenState();
}

class _ThemeChangerScreenState extends State<ThemeChangerScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("App Theme Mode Changer", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,),),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        RadioListTile<ThemeMode>(
            title: Text("Light Mode"),
            value: ThemeMode.light,
            groupValue: themeProvider.themeMode,
            onChanged: (value) => {themeProvider.setThemeMode(value!)}),

        RadioListTile<ThemeMode>(
            title: Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: themeProvider.themeMode,
            onChanged: (value) => {themeProvider.setThemeMode(value!)}),

        RadioListTile<ThemeMode>(
            title: Text("System Mode"),
            value: ThemeMode.system,
            groupValue: themeProvider.themeMode,
            onChanged: (value) =>
                {themeProvider.setThemeMode(value!)}), // RadioListTile
      ]),
    );
  }
}
