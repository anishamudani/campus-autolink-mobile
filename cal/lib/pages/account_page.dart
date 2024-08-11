import 'dart:convert';

import 'package:cal/global_variables.dart';
import 'package:cal/providers/sample..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final passenger = Provider.of<SampleProvider>(context).passengerInfor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text("My Account"),
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0, right: 13, top: 8, bottom: 30),
            child: ListTile(
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
              title: Text("${passenger['initial']} ${passenger['surname']}"),
              subtitle: Text(passenger['email']),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).primaryColorLight,
                        width: 0.5
                        ),
                      ),
                    ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.auto_awesome_motion_rounded, size: 25, color: Theme.of(context).primaryColor,),
                            const SizedBox(width: 13,),
                            const Text("First Name(s):",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text("${passenger['name']}",
                          style: TextStyle(
                            fontSize: 15
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 0.5
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.auto_awesome_motion_outlined, size: 25, color: Theme.of(context).primaryColor,),
                            const SizedBox(width: 13,),
                            const Text("Last Name:",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text("${passenger['surname']}",
                            style: TextStyle(
                                fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 0.5
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.phone, size: 25, color: Theme.of(context).primaryColor,),
                            const SizedBox(width: 13,),
                            const Text("Phone:",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text("${passenger['phone']}",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 0.5
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.transgender, size: 25, color: Theme.of(context).primaryColor,),
                            const SizedBox(width: 13,),
                            const Text("Gender:",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text("${passenger['gender']}",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
