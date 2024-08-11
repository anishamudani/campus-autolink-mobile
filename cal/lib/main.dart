import 'package:cal/pages/account_page.dart';
import 'package:cal/pages/create_account_passenger.dart';
import 'package:cal/pages/create_ride_page.dart';
import 'package:cal/pages/home_page.dart';
import 'package:cal/pages/login_page.dart';
import 'package:cal/pages/ride_details_page.dart';
import 'package:cal/pages/ride_details_passenger_page.dart';
import 'package:cal/providers/sample..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SampleProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Campus Autolink',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),

        home: const LoginPage(),
      ),
    );
  }
}
