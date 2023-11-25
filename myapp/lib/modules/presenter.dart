import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myapp/modules/userUtil/user.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  authenticateUser() {
    User user = User();
    if (user.isLoggedIn()) {
      return;
    }
    return Modular.to.navigate('/home');
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      authenticateUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/logo.png", width: 110, height: 110),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: Text(
                  "Scaling up Business",
                  style: Theme.of(context).textTheme.labelLarge,
                ).animate().fade(duration: 1000.ms)),
          )
        ],
      )),
    );
  }
}
