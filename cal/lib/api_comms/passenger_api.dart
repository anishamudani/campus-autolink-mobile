import "package:http/http.dart" as http;
import "package:flutter/material.dart";

bool isLoading = true;
passengerLogin(String emailAddress) async{
  try{
    isLoading = true;
    http.Response response;
    response = await http.post(
      Uri.parse("https://campus-autolink-012bf832663f.herokuapp.com/passenger-login"),
      body: {"email_address": emailAddress},
    );
    isLoading = false;
  } catch(e){
    return (e);
  }
}
