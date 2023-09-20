import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/exercise_widget.dart';

class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/exercise.png"),
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
          ExerciseWidget(size: size),
          const Divider(),
          ExerciseWidget(size: size),
          const Divider(),
          ExerciseWidget(size: size),
          const Divider(),
        ],
      ),
    );
  }
}
