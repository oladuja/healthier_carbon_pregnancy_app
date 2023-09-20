import 'package:flutter/material.dart';

class AppTab extends StatelessWidget {
  const AppTab({
    super.key,
    required this.text,
    required this.index,
    required this.selectedindex,
  });
  final String text;
  final int index;
  final int selectedindex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 75,
          child: Divider(
            color: (selectedindex == index) ? Colors.black : Colors.white,
            thickness: 3,
          ),
        )
      ],
    );
  }
}
