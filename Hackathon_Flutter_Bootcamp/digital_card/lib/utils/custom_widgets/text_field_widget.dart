// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.labelString,
      required this.icon,
      required this.controller});

  TextEditingController controller = TextEditingController();
  final String labelString;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Color(0xff745c9e)),
      decoration: InputDecoration(
          suffix: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 156, 129, 203),
            ),
          ),
          labelStyle: const TextStyle(color: Color(0xff745c9e)),
          labelText: labelString,
          contentPadding: const EdgeInsets.only(left: 20),
          fillColor: Colors.white54,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
