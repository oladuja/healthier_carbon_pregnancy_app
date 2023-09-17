import 'package:flutter/material.dart';

class NotifcationItem extends StatelessWidget {
  final dynamic index;

  const NotifcationItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dismissible(
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete_outline_outlined,
            color: Colors.black,
          ),
        ),
      ),
      key: ValueKey(index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0XFFFEF5F3),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nutrition Live", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(
                  '08 April',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Here\'s what you missed in Nutrition Live',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
