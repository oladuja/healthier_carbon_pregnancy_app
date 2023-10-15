import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/utils/spacer.dart';

class WaitingToJoin extends StatelessWidget {
  const WaitingToJoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VerticalSpacer(20),
            Text("Creating a Room",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
