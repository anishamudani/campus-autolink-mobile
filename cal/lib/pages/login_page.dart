import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cal/api_comms/passenger_api.dart';
import 'package:cal/pages/create_account_driver.dart';
import 'package:cal/pages/create_account_passenger.dart';
import 'package:cal/pages/home_page.dart';
import 'package:cal/pages/ride_details_page.dart';
import 'package:cal/providers/sample..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global_variables.dart';
import 'home_page_driver.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // late bool isChecked = false;
  TextEditingController emailController = TextEditingController();
  late int selectedIndex = 0;
  late Map<String, dynamic> jsonResponse;
  bool isLoading = false;

  passengerLogin(String passEmailAddress) async {
    http.Response passResponse;
    setState(() {
      isLoading = true;
    });
    try {
      passResponse = await http.post(
        Uri.parse(
            "https://campus-autolink-012bf832663f.herokuapp.com/passenger-login"),
        body: {"email_address": passEmailAddress},
      );
      jsonResponse = jsonDecode(passResponse.body);
      Provider.of<SampleProvider>(context, listen: false)
          .updatePassData(jsonResponse);

      if (passResponse.statusCode == 302) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
      } else {
        print(passResponse.statusCode);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("User with email not found")));
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

  driverLogin(String driverEmailAddress) async {
    setState(() {
      isLoading = true;
    });
    try {
      http.Response passResponse;
      passResponse = await http.post(
        Uri.parse(
            "https://campus-autolink-012bf832663f.herokuapp.com/driver-login"),
        body: {"email_address": driverEmailAddress},
      );
      print("code: ${passResponse.body}");

      if (passResponse.statusCode == 302) {
        print(passResponse.statusCode);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login successuful")));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) {
          return const DriverHomePage();
        }));
      } else {
        print(passResponse.statusCode);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("User with email not found")));
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
          elevation: 2,
          centerTitle: true,
          title: const Text(
            "Campus AutoLink",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
            ),
          ),
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
                    Text("Fetching your account from the server..."),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 37, right: 37, top: 0, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(list.toString()),
                      const SizedBox(
                        height: 80,
                      ),
                      // Image(image: )

                      const Center(
                        child: Text(
                          "Login to Your Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 23,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Enter your Email",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixText: ("\t\t\t\t\t"),
                          // suffix: Text("@gmail.com"),
                          focusedBorder: border,
                          enabledBorder: border,
                          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
                          // height: 50, // Fixed height to prevent RenderFlex children have non-positive intrinsic heights error
                        ),
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      Column(
                        children: [
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                passengerLogin(emailController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[300],
                                minimumSize: const Size(
                                  300,
                                  60,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text(
                                "Continue as Passenger",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const CreateAccountPassenger();
                                }));
                              },
                              child: const Text.rich(
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Signup as a passenger",
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              driverLogin(emailController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[200],
                              minimumSize: const Size(
                                300,
                                60,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text(
                              "Continue as Driver",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ],
                      ),

                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const CreateAccountDriver();
                            }));
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "Signup as a Driver",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
