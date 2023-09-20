import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 219,
                  height: 38,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: const Color(0XFF808080).withOpacity(0.1),
                      filled: true,
                      hintText: 'Search events',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      enabled: true,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.0),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: const Color(0XFFFEF7F6),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0XFF666666),
                    ),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.video,
                    size: 16,
                    color: Color(0XFF666666),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: const Color(0XFFFEF7F6),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0XFF666666),
                    ),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.solidBell,
                    size: 16,
                    color: Color(0XFF666666),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              "Live",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/live.png"),),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: size.width,
                  height: 165,
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get to know your body better',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    CheckInButton(
                      text: "Join Live",
                    )
                  ],
                ),
              ],
            ),

            //

            const SizedBox(height: 15),
            const Text(
              "Scheduled Check-in",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                                      image: DecorationImage(image: AssetImage("assets/images/schedule.png"),),

                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: size.width,
                  height: 165,
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Eat Healthy',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    CheckInButton(text: 'Scheduled'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                                      image: DecorationImage(image: AssetImage("assets/images/schedule.png"),),

                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: size.width,
                  height: 165,
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Eat Healthy',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    CheckInButton(text: 'Scheduled'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CheckInButton extends StatelessWidget {
  const CheckInButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          color: const Color(0XFFFEF5F3),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
