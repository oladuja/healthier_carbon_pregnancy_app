import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTextFieldPassword extends StatefulWidget {
  final TextEditingController controller;

  String? Function(String?)? validator;
  AppTextFieldPassword({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  State<AppTextFieldPassword> createState() => _AppTextFieldPasswordState();
}

class _AppTextFieldPasswordState extends State<AppTextFieldPassword> {
  bool isVissible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      cursorColor: Colors.black,
      obscureText: isVissible,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isVissible = !isVissible;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FaIcon(
                isVissible ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash),
          ),
        ),
        fillColor: const Color(0XFFE7DFDC).withOpacity(0.8),
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
