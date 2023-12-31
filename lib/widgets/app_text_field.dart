import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.type,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
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
