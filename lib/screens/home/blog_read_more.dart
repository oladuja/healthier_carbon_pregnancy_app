import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/notification_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/article._widget.dart';

class BlogReaMoreScreen extends StatelessWidget {
  const BlogReaMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 219,
                      height: 38,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          fillColor: const Color(0XFF808080).withOpacity(0.1),
                          filled: true,
                          hintText: 'Type keyword',
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
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(NotificationScreen.routeName),
                      child: const FaIcon(
                        FontAwesomeIcons.bell,
                        color: Color(0XFF666666),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/categories.png"),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: size.width,
                  height: 165,
                ),
                const SizedBox(height: 15),
                const Text(
                  'These five food types should be in your diet if you feel fatigue ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'By Healthier Carbon  10:00 PM',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 15),
                Text('''
Cras diam metus, gravida vitae vulputate non, porta ac lectus. Aliquam lacinia euismod turpis id imperdiet. Mauris congue odio id dolor condimentum, vitae viverra ante commodo. Fusce a quam varius, auctor mi sed, malesuada mi. 

Nam vulputate massa at nulla accumsan, eget suscipit nisi lobortis. Donec egestas tincidunt ante, ut rutrum ex facilisis vitae. Ut interdum interdum sem, nec fermentum neque volutpat nec. Suspendisse rutrum interdum lectus in viverra.'''),
                const SizedBox(height: 10),
                ArticleWidget(size: size),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
