import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/blog_read_more.dart';

class VideoWidget extends StatelessWidget {
  final String text;

  const VideoWidget({
    super.key,
    required this.size,
    required this.text,
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
                  image: AssetImage("assets/images/morevideos.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Why you need vegetables in your diet',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
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
