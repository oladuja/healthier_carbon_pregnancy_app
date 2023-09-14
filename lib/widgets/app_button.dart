import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;

  final void Function()? onTap;

  const AppButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              color: Colors.black,
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          color: const Color(0XFFFEF5F3),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
