import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phoneNumber;
  final DateTime selectedDate;
  final Color selectedColor;
  final String? selectedFile;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.selectedDate,
    required this.selectedColor,
    this.selectedFile,
  });
}
