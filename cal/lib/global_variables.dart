import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


final border =
OutlineInputBorder(
    borderSide: const BorderSide(
        color: Colors.grey
    ),
    borderRadius: BorderRadius.circular(40)
);

class TimeMaskTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final RegExp timeRegExp = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
    if (timeRegExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}