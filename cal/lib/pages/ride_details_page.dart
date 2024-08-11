import 'dart:ui';

import 'package:cal/pages/create_account_driver.dart';
import 'package:cal/pages/create_ride_page.dart';
import 'package:flutter/material.dart';

class RideDetails extends StatefulWidget {
  const RideDetails({super.key});

  @override
  State<RideDetails> createState() => _RideDetailsState();
}

class _RideDetailsState extends State<RideDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text("Ride Details"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 100),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
            elevation: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Center(child: Icon(Icons.drive_eta, size: 60, color: Colors.blue,)),
                      SizedBox(height: 14,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(0),
                        color: Color.fromARGB(100, 198, 229, 245),
                        child: Text.rich(
                          TextSpan(
                            text: "Ride to:\n",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "Location",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 17
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 14,),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(0),
                        color: Color.fromARGB(150, 194, 230, 252),
                        child: Text.rich(
                          TextSpan(
                            text: "Parking bay:\n",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "Location",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 14,),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(0),
                        color: Color.fromARGB(100, 198, 229, 245),
                        child: Text.rich(
                          TextSpan(
                            text: "Drop off points:\n",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "Location",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 14,),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(0),
                        color: Color.fromARGB(150, 194, 230, 252),
                        child: Text.rich(
                          TextSpan(
                            text: "Departure time:\n",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "time",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}

