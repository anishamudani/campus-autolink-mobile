import 'dart:ui';

import 'package:cal/providers/sample..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RideDetailsPassengerPage extends StatelessWidget {
  const RideDetailsPassengerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedRide = Provider.of<SampleProvider>(context).chosenRide;
    print(selectedRide.runtimeType);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text("Passenger Ride Details"),
      ),
      body: selectedRide == null
          ? Text("Please select a ride first")
          : Padding(
              padding: const EdgeInsets.all(14),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Icon(
                              Icons.co_present_rounded,
                              size: 60,
                              color: Colors.blue,
                            )),
                            SizedBox(
                              height: 14,
                            ),
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
                                      text: selectedRide["pickPoint"] as String,
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
                            SizedBox(
                              height: 14,
                            ),
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
                                      text:
                                          selectedRide["Destination"] as String,
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
                            SizedBox(
                              height: 14,
                            ),
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
                                      text: selectedRide["time"] as String,
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
                            SizedBox(
                              height: 14,
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(0),
                              color: Color.fromARGB(100, 198, 229, 245),
                              child: Text.rich(
                                TextSpan(
                                  text: "Ride fare:\n",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "R10",
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
                            SizedBox(
                              height: 14,
                            ),
                            Text(
                              "Its your sole responsibility to be there on time",
                              style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
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
