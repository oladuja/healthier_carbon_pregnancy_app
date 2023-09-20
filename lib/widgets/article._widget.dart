import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/blog_read_more.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
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
                    'Anxiety got you down? We got experts to help you overcome',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        'Healthier Carbon',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      FaIcon(
                        FontAwesomeIcons.solidBookmark,
                        size: 9,
                        color: Color(0XFF666666),
                      ),
                      SizedBox(width: 10),
                      FaIcon(
                        FontAwesomeIcons.shareNodes,
                        color: Color(0XFF666666),
                        size: 9,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 150,
              height: 90,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/articles.png"),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
