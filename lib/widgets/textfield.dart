import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  String labelText;
  bool obscured ;
  TextEditingController controller;
  IconData icon;


  TextInputField({Key? key,
    required this.labelText,
    required this.controller,
    required this.icon,
    this.obscured = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 42, right: 39),
      child: TextFormField(
        cursorColor: const Color.fromARGB(128, 255, 255, 255),
        obscureText: obscured,
        controller: controller,
        style: const TextStyle(
            color: Color.fromARGB(128, 255, 255, 255)
        ),
        decoration: InputDecoration(
          suffixIcon: Icon(icon, color: const Color.fromARGB(128, 255, 255, 255)),
          labelText: labelText,

          labelStyle: const TextStyle(
              color: Color.fromARGB(128, 255, 255, 255),
              fontSize: 16
          ),
          enabledBorder: OutlineInputBorder(

              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(0xFFF205E2),

              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(0xFFF205E2),

              )
          ),
        ),
      ),
    );
  }
}
