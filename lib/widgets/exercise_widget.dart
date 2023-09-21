import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/blog_read_more.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const BlogReaMoreScreen(),
        ),
      ),
      child: SizedBox(
        width: size.width,
        child: Row(
          children: [
            Container(
              width: 150,
              height: 90,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/more_vid.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1st Trimester',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Various gym equipment and how to use them',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Duration: 52 mins',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      FaIcon(
                        FontAwesomeIcons.download,
                        size: 12,
                        color: Color(0XFF666666),
                      ),
                      SizedBox(width: 10),
                      FaIcon(
                        FontAwesomeIcons.share,
                        color: Color(0XFF666666),
                        size: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
