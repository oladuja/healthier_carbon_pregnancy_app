import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            shadowColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          onPressed: () {},
          icon: FaIcon(
            icon,
            color: Colors.black,
          ),
          label: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
