import 'package:cal/pages/create_ride_page.dart';
import 'package:cal/pages/ride_details_page.dart';
import 'package:flutter/material.dart';

class DriverHomePage extends StatefulWidget {
  const DriverHomePage({super.key});

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  int currentPage=0;
  late List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = const [CreateRidePage(), RideDetails()];
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
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.account_circle_outlined),
          //     label: "Account"
          // ),
        ],
      ),
    );
  }
}
