import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SampleProvider extends ChangeNotifier{

  List<Map<String, dynamic>> rides = [
    {
      "initial": "B.",
      "last_name": "Nkomo",
      "time": "12PM",
      "carType": "Honda Fit",
      "carReg": "AFN 1234",
      "pickPoint": "Nust campus Delta car park",
      "Destination": "Art Gellery, Byo CBD",
      "availableSeats": 2,
    },
    {
      "initial": "M.",
      "last_name": "Brown",
      "time": "2PM",
      "carType": "VW Golf GT",
      "carReg": "AMB 4543",
      "pickPoint": "Nust campus Admin car park",
      "Destination": "City Hall, Byo CBD",
      "availableSeats": 1,
    },
    {
      "initial": "S.",
      "last_name": "Ncube",
      "time": "4PM",
      "carType": "Nissan np300",
      "carReg": "AFQ 0982",
      "pickPoint": "Nust campus Taxi rank (sheds)",
      "Destination": "Byo Center, Byo CBD",
      "availableSeats": 3,
    },
    {
      "initial": "M.",
      "last_name": "Man",
      "time": "4PM",
      "carType": "Nissan np300",
      "carReg": "AFQ 0982",
      "pickPoint": "Nust campus Taxi rank (sheds)",
      "Destination": "Byo Center, Byo CBD",
      "availableSeats": 3,
    },
    {
      "initial": "K.",
      "last_name": "Someone",
      "time": "4PM",
      "carType": "Nissan np300",
      "carReg": "AFQ 0982",
      "pickPoint": "Nust campus Taxi rank (sheds)",
      "Destination": "Byo Center, Byo CBD",
      "availableSeats": 3,
    },
  ];

  // Map<String, dynamic> passengerInfor =
  // {
  //   "name": "Macdee",
  //   "surname": "Man",
  //   "gender": "male",
  //   "phone": 0783773993,
  //   "email": "macddeemanana@gmail.com",
  //   "initial": "M.",
  // };

  List<Map<String, dynamic>> driverInfor = [
    {
      "name": "Ben",
      "surname": "Man",
      "gender": "male",
      "phone": 0783773993,
      "email": "ealmanana@gmail.com",
      "licence": "AFN 1234",
      "carModel": "Nissan np300",
      "carReg": "AFQ 0982",
    }
  ];

  List<Map<String, dynamic>> rideInformation = [
    {
      "pickPoint": "Nust campus Delta car park",
      "Destination": "Art Gellery, Byo CBD",
      "availableSeats": 2,
      "time": "12PM",
      "driver_mail": "example@gmail.com"
    },
  ];

  late Map<String, dynamic> passengerInfor;

  void updatePassData(Map<String, dynamic> response){
    passengerInfor =
    {
      "name": response["name"][0].toUpperCase() + response["name"].substring(1),
      "surname": response["surname"][0].toUpperCase() + response["surname"].substring(1),
      "gender": response["gender"],
      "phone": response["phone"],
      "email": response["email_address"],
      "initial": response["name"][0].toUpperCase()
    };

    notifyListeners();
  }

  List<dynamic> allRides = [];
  void availableRides(List<dynamic> response){

    for(Map<String, dynamic>ride in response){
      allRides.add(
          {
            "initial": ride["name"][0].toUpperCase() ,
            "last_name": ride["surname"][0].toUpperCase()+ ride["surname"].substring(1),
            "time": ride["depature_time"],
            "carType": ride["vehicle_model"][0].toUpperCase() + ride["vehicle_model"].substring(1),
            "carReg": ride["vehicle_reg"].toUpperCase(),
            "pickPoint": ride["pick_point"][0].toUpperCase() + ride["pick_point"].substring(1),
            "Destination": ride["drop_point"][0].toUpperCase() + ride["drop_point"].substring(1),
            "availableSeats": ride["available_seats"],
            "driverEmail": ride["driver_email"]
          }
      );
    }
    notifyListeners();
  }

  dynamic chosenRide;
  void  selectedRide(dynamic ride){
    try{
      chosenRide = {
        "Destination": ride["Destination"][0].toUpperCase() + ride["Destination"].substring(1),
        "pickPoint": ride["pickPoint"][0].toUpperCase() + ride["pickPoint"].substring(1),
        "time": ride["time"],
      };
    }
    catch(e) {
      chosenRide = null;
    }

    notifyListeners();
  }

}

