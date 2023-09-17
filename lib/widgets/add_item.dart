
import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  const AddItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 4,
            ),
            SizedBox(width: 10),
            Text(
              'Discuss with the staffer about how to sleep better at night',
              style: TextStyle(),
            )
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 4,
            ),
            SizedBox(width: 10),
            Text(
              'Ask for advice on how to deal with my frequent headachesF',
              style: TextStyle(),
            ),
          ],
        ),
      ],
    );
  }
}
