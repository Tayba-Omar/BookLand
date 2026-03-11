import 'package:flutter/material.dart';
import 'package:newfinalproject/Customize/IntroPageData.dart';
import 'package:newfinalproject/Customize/IntroPageModel.dart' show PageModel;
import 'package:newfinalproject/Screen/creatprofileScreen.dart';
import 'package:newfinalproject/Style/Color.dart';
import 'package:concentric_transition/concentric_transition.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({super.key});

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  int _currentPage = 0;

  final pages = [
    PageData(image: "assets/images/read01.jpg", title: "Read"),
    PageData(image: "assets/images/save01.jpg", title: "Save"),
    PageData(image: "assets/images/share01.jpg", title: "Customize"),
    PageData(image: "assets/images/f11.jpg", title: "Search"),
  ];

  void _goToCreateProfile() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const CreatProfile()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ConcentricPageView(
        colors: [txtColor, Colors.white, lightOrange, Colors.white],
        radius: screenWidth * 0.1,
        itemCount: pages.length,
        onChange: (index) => setState(() => _currentPage = index),
        nextButtonBuilder: (context) {
          // سهم التنقل بين الصفحات (يختفي بالآخر)
          if (_currentPage >= pages.length - 1) return const SizedBox();
          return Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
            color: txtMainColor,
          );
        },
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          final isLast = index == pages.length - 1;

          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageModel(page: page), // رجّع عرض المحتوى
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (!isLast)
                        TextButton(
                          onPressed: _goToCreateProfile,
                          child: Text(
                            "Skip",
                            style: TextStyle(fontSize: 18, color: txtMainColor),
                          ),
                        )
                      else
                        ElevatedButton(
                          onPressed: _goToCreateProfile,
                          child: Text(
                            "Start",
                            style: TextStyle(fontSize: 18, color: txtMainColor),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}