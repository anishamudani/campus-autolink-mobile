import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../global_variables.dart';

class CreateRidePage extends StatefulWidget {
  const CreateRidePage({super.key});

  @override
  State<CreateRidePage> createState() => _CreateRidePageState();
}

class _CreateRidePageState extends State<CreateRidePage> {
  late bool isChecked = false;
  TextEditingController pickPoint = TextEditingController();
  TextEditingController dropPoint = TextEditingController();
  TextEditingController seats = TextEditingController();
  TextEditingController time = TextEditingController();

  late int selectedIndex = 0;
  late Map<String, dynamic> jsonResponse;
  bool isLoading = false;

  // controllers

  createRide() async {
    http.Response passResponse;
    var body = {
      "pick_point": pickPoint.text,
      "drop_point": dropPoint.text,
      "available_seats": seats.text.trim(),
      "depature_time": time.text.trim()
    };

    print(body);

    setState(() {
      isLoading = true;
    });
    try {
      passResponse = await http.post(
        Uri.parse(
            "https://campus-autolink-012bf832663f.herokuapp.com/create-ride"),
        body: body
      );
      
      if (passResponse.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                const Text("Successifuly created ride!")));
      } else {
        print(body);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Successifuly created ride!")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error Check your internet")));
      return (e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text("Create Ride"),
      ),
      body: isLoading
          ? const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Hang on, submitting your ride..."),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  const Text(
                    "Share a ride, share a smile",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 26,
                        fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: TextField(
                            controller: pickPoint,
                            decoration: InputDecoration(
                              hintText: "Parking location",
                              prefixText: ("\t\t\t\t\t"),
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: TextField(
                            controller: dropPoint,
                            decoration: InputDecoration(
                              hintText: "Destinations(s)",
                              prefixText: ("\t\t\t\t\t"),
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: TextField(
                            controller: seats,
                            decoration: InputDecoration(
                              hintText: " Available Seats",
                              prefixText: ("\t\t\t\t\t"),
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: TextField(
                            controller: time,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: "Departure time (00:00)",
                              prefixText: ("\t\t\t\t\t"),
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        Icon(
                          Icons.arrow_downward_outlined,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        Icon(
                          Icons.drive_eta_outlined,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            createRide();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            minimumSize: const Size(double.infinity, 40),
                          ),
                          child: const Text(
                            "Create Ride",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {

                          },
                          child: const Text(
                            "By creating a ride, you\n agree to our safety regulations",
                            style: TextStyle(),
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
