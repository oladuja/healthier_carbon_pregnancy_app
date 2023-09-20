import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.size, required this.image,
  });

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.fill),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          width: size.width,
          height: 200,
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
              size: 14,
            ),
            SizedBox(width: 5),
            Text(
              'Maddy and 765 others',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        Row(
          children: [
            ElevatedButton.icon(
              style: const ButtonStyle(
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.solidHeart,
                color: Colors.grey,
              ),
              label: const Text(
                'Like',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              style: const ButtonStyle(
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.comment,
                color: Colors.grey,
              ),
              label: const Text(
                'Comment',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              style: const ButtonStyle(
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.share,
                color: Colors.grey,
              ),
              label: const Text(
                'Share',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
