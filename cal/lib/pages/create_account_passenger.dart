import 'dart:convert';

import 'package:cal/api_comms/passenger_api.dart';
import 'package:cal/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../global_variables.dart';
import '../providers/sample..dart';

class CreateAccountPassenger extends StatefulWidget {
  const CreateAccountPassenger({super.key});

  @override
  State<CreateAccountPassenger> createState() => _CreateAccountPassengerState();
}

class _CreateAccountPassengerState extends State<CreateAccountPassenger> {
  late bool isChecked = false;
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  late int selectedIndex = 0;
  late Map<String, dynamic> jsonResponse;
  bool isLoading = false;

  // controllers

  passengerSignup() async {
    http.Response passResponse;
    setState(() {
      isLoading = true;
    });
    try {
      passResponse = await http.post(
        Uri.parse(
            "https://campus-autolink-012bf832663f.herokuapp.com/passenger-signup"),
        body: {
          "email_address": emailAddress.text,
          "name": name.text,
          "surname": surname.text,
          "gender": gender.text,
          "phone": phone.text,
        },
      );

      if (passResponse.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text("Account has been successifuly created.\nPlease login!")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid email address")));
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
        title: const Text("Create your account"),
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
                  Text("Submitting your details to the server..."),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 0, bottom: 15),
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: TextField(
                      controller: name,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        prefixText: ("\t\t\t\t\t"),
                        hintText: "First name",
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: TextField(
                      controller: surname,
                      decoration: InputDecoration(
                        hintText: "Last name",
                        prefixText: ("\t\t\t\t\t"),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: TextField(
                      controller: gender,
                      decoration: InputDecoration(
                        hintText: "Gender",
                        prefixText: ("\t\t\t\t\t"),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: TextField(
                      controller: phone,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        prefix: Text("+263\t"),
                        // prefixStyle: TextStyle(
                        //   color: Colors.black12,
                        //   fontSize: 15,
                        // ),
                        hintText: "Your Phone number",
                        border: border,
                        enabledBorder: border,
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: TextField(
                      controller: emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixText: ("\t\t\t\t\t"),
                        suffix: Text("@gmail.com"),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        'Terms and Conditions',
                        style: TextStyle(fontSize: 20),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'I accept the terms and conditions',
                          style: TextStyle(fontSize: 16),
                        ),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      passengerSignup();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const LoginPage();
                      }));
                    },
                    child: const Text(
                      "Already have an account Login",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
