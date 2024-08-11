import 'dart:convert';

import 'package:cal/pages/ride_details_passenger_page.dart';
import 'package:cal/providers/sample..dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../global_variables.dart';

class AvailableRides extends StatefulWidget {
  const AvailableRides({super.key});

  @override
  State<AvailableRides> createState() => _AvailableRidesState();
}

class _AvailableRidesState extends State<AvailableRides> {
  int selectedIndex = -1;
  late dynamic selectedRideInfo;
  bool isLoading = false;
  late List<dynamic> jsonResponse;

  // Future apicall() async {
  //   http.Response response;
  //   response = await http.get(Uri.parse(
  //       "https://campus-autolink-012bf832663f.herokuapp.com/?format=json"));
  //   if (response.statusCode == 200) {
  //     stringResponse = response.body;
  //     jsonResponse = jsonDecode(response.body);
  //     // print(jsonResponse);
  //   }
  // }

  availableRides() async{
    http.Response availableRidesResponse ;
    setState(() {
      isLoading=true;

    });
    try{
      availableRidesResponse = await http.get(Uri.parse(
          "https://campus-autolink-012bf832663f.herokuapp.com/available-rides")
      );
      jsonResponse = jsonDecode(availableRidesResponse.body);
      Provider.of<SampleProvider>(context, listen: false).availableRides(jsonResponse);

      if(availableRidesResponse.statusCode == 200){
      } else {
        print(availableRidesResponse.statusCode);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Unable to login")));
      }
    }
    catch(e)
    {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error Check your internet")));

      print(e);
      return (e);

    }
    finally
    {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    availableRides();
  }
  @override
  Widget build(BuildContext context) {
    final availableRides = Provider.of<SampleProvider>(context).allRides;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: const Text("Available Rides",
        ),
      ),
      body: isLoading
        ? const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Center(child: LinearProgressIndicator(),),
              SizedBox(height: 12,),
              Text("Loading rides..."),
            ],
          ),
        )
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: availableRides.length,
                      itemBuilder: (context, index){
                        final ride = availableRides[index];
                        return  GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedRideInfo = ride;
                              selectedIndex = index;
                            });
                          },
                          child: ColoredBox(
                            color: selectedIndex == index
                              ? const Color.fromARGB(150, 194, 230, 252)
                              : Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.car_repair_outlined),
                                  shape: const Border(
                                    bottom: BorderSide(color: Colors.grey),
                                  ),
                                  trailing: Column(
                                    children: [
                                      const Icon(Icons.account_circle),
                                      Text("${ride['initial']} ${ride['last_name']}"),
                                    ],
                                  ),
                                  title: Text("Today ${ride['time']}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  titleAlignment: ListTileTitleAlignment.threeLine,
                                  contentPadding: const EdgeInsets.all(0),
                                  minLeadingWidth: 0,
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${ride['carType']} . ${ride['carReg']}",
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("📍",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(width: 5,),
                                          Text(ride["pickPoint"] as String,),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const  Text("🛑",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(width: 5,),
                                          Text(ride["Destination"] as String),
                                        ],
                                      ),
                                      const SizedBox(height: 6,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.group),
                                          const SizedBox(width: 5,),
                                          Text("${ride['availableSeats']} Available seats",),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),

                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(245, 247, 249, 1),
                  ),
                  child: Column(
                    children: [ const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text("Please select a ride and press here",
                        style: TextStyle(

                        ),
                      ),
                    ),

                      const Icon(Icons.arrow_downward_rounded),
                      const Icon(Icons.drive_eta_sharp),

                      ElevatedButton(
                        onPressed: (){
                          Provider.of<SampleProvider>(context, listen: false).selectedRide(selectedRideInfo);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context){
                                return const RideDetailsPassengerPage();
                              })
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          minimumSize: const Size(double.infinity, 40),
                        ),
                        child: const Text("Take Ride",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
