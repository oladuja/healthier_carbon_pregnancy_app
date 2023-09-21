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
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0XFFFEF5F3),
          ),
          child: Container(
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
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "More Videos",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              VideoWidget(size: size, text: 'Breakfast'),
              const Divider(),
              VideoWidget(
                size: size,
                text: 'Launch',
              ),
              const Divider(),
              VideoWidget(
                size: size,
                text: 'Snack',
              ),
              const Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
