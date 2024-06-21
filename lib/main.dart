import 'package:flutter/material.dart';
import 'package:formula1/Data/constructor_model.dart';
import 'package:formula1/Data/driver_model.dart';
import 'package:formula1/Data/race_results_model.dart';
import 'package:provider/provider.dart';
import 'main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConstructorModel()),
        ChangeNotifierProvider(create: (context) => DriverModel()),
        ChangeNotifierProvider(create: (context) => RaceResultsModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        secondaryHeaderColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            color: Colors.red,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        ),
        tabBarTheme: const TabBarTheme(
          labelStyle: TextStyle(color: Colors.white, shadows: [
            Shadow(
              color: Colors.white,
              blurRadius: 0.5,
            )
          ]),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
