import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/video_widget.dart';

class Nutriton extends StatelessWidget {
  const Nutriton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/nutrition.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          width: size.width,
          height: 175,
        ),
        const SizedBox(height: 15),
        const Text(
          "More Videos",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        VideoWidget(size: size),
        const Divider(),
        VideoWidget(size: size),
        const Divider(),
        VideoWidget(size: size),
        const Divider(),
      ],
    );
  }
}
