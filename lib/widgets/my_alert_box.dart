import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback onSave;
  final VoidCallback onCencel;
  final String hintText;
  //
  const MyAlertBox(
      {Key? key,
      this.controller,
      required this.onSave,
      required this.onCencel,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onCencel,
          color: Colors.deepOrange,
          child: const Text(
            'Cencel',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          onPressed: onSave,
          color: Colors.deepOrange,
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
