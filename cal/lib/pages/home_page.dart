import 'package:cal/pages/account_page.dart';
import 'package:cal/pages/available_rides_page.dart';
import 'package:cal/pages/ride_details_passenger_page.dart';
import 'package:flutter/material.dart';

import '../global_variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage=0;
  late List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = const [AvailableRides(),RideDetailsPassengerPage(), AccountPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            currentPage = value;
          },);
        },
        backgroundColor: const Color.fromRGBO(245, 247, 249, 1),
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet_outlined),
            label: "Activity",


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
              label: "Account"
          ),
        ],
      ),

    );
  }
}
