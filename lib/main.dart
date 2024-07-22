import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:formula1/Authentication/login_page.dart';
import 'package:formula1/Authentication/verify_email_page.dart';
import 'package:formula1/Data/constructor_model.dart';
import 'package:formula1/Data/driver_model.dart';
import 'package:formula1/Data/race_results_model.dart';
import 'package:formula1/firebase_options.dart';
import 'package:provider/provider.dart';
import 'Authentication/signup_page.dart';
import 'constants/constants.dart';
import 'main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Fi
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
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.red),
          labelStyle: TextStyle(color: Color.fromARGB(255, 231, 193, 111)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.red,
            ),
            bodySmall: TextStyle(
              color: Colors.red,
            ),
            labelSmall: TextStyle(
              color: Colors.red,
            )),
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
      home: _buildBasedOnUser(context),
      routes: {
        loginRoute: (context) => const LoginPage(),
        signupRoute: (context) => const SignupPage(),
        verifyEmailRoute: (context) => const VerifyEmailPage(),
        mainScreenRoute: (context) => const MainScreen(),
      },
    );
  }

  Widget _buildBasedOnUser(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified) {
                  return const MainScreen();
                } else {
                  return const VerifyEmailPage();
                }
              } else {
                return const LoginPage();
              }
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
