import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;

  const AppTextField({
    super.key,
    required this.type,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: const Color(0XFFE7DFDC).withOpacity(0.5),
        filled: true,
        hintText: 'Type here',
        hintStyle: const TextStyle(
          color: Color(0XFF666666),
          fontSize: 14,
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
