import 'package:flutter/material.dart';
import 'package:flutter_provider/single_provider/module/theme_changer_screen.dart';
import 'package:flutter_provider/single_provider/provider/circle_provider.dart';
import 'package:flutter_provider/single_provider/provider/count_provider.dart';
import 'package:flutter_provider/single_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CircleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        )
      ],


      child: Builder(builder: (BuildContext context) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: 'Flutter Demo',
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
            useMaterial3: true,
            primaryColor: Colors.red,
            appBarTheme: AppBarTheme(color: Colors.deepPurple),
          ),
          theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
              useMaterial3: true,
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(color: Colors.teal),
              primaryColor: Colors.blue),
          themeMode: themeProvider.themeMode,
          home: ThemeChangerScreen(),
        );
      }),
    );
  }
}
