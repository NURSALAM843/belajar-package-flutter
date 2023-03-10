import 'package:dasar_flutter_section_4/pages/belajar_screen.dart';
import 'package:dasar_flutter_section_4/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class InroductionScreen extends StatelessWidget {
  const InroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of introduction page",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            // child: Icon(Icons.waving_hand, size: 50.0),
            child: Container(
              width: 250,
              height: 250,
              child: Lottie.asset("assets/lotties/screen_1.json",
                  fit: BoxFit.contain),
            ),
          ),
        ),
        PageViewModel(
          title: "Title of introduction page",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            // child: Icon(Icons.home_max_rounded, size: 50.0),
            child: Container(
              width: 250,
              height: 250,
              child: Lottie.asset("assets/lotties/screen_2.json",
                  fit: BoxFit.contain),
            ),
          ),
        )
      ],
      showNextButton: true,
      next: (Text("Next >>>")),
      done: const Text(
        "Login",
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }
}
