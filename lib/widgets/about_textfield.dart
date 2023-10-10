import 'package:flutter/material.dart';

class AboutAppTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const AboutAppTextField({
    super.key,
    required this.text, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: const Color(0XFFE7DFDC).withOpacity(0.5),
        filled: true,
        hintText: text,
        hintStyle: const TextStyle(
          color: Color(0XFF666666),
          fontSize: 18,
        ),
        enabled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFF666666),
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
