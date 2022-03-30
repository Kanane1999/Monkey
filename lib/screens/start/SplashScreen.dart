import 'package:flutter/material.dart';
import 'package:monkey/screens/start/start_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasStared = false;
  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    Future.delayed(Duration(seconds: 1), (() {
      setState(() {
        hasStared = true;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            backGround(),
            Center(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [
                    appName(),
                    slogant(),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              onEnd: () {
                Navigator.pushReplacementNamed(context, StartPage.routeName);
              },
              curve: Curves.bounceInOut,
              top: hasStared
                  ? MediaQuery.of(context).size.height / 2 - 150
                  : -200,
              left: MediaQuery.of(context).size.width / 2 - 75,
              child: icon(),
            ),
          ],
        ),
      ),
    );
  }

  Widget backGround() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/meal.jpg'), fit: BoxFit.cover),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(.7),
      ),
    );
  }

  //here is a slogant
  Widget slogant() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Débuter votre journée en consomant un produit de Meal monkey",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  appName() {
    return Text.rich(TextSpan(
      text: "Meal",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
      children: const <TextSpan>[
        TextSpan(
            text: "Monkey",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ))
      ],
    ));
  }

//here is our app name

//here we create our splach's image
  Widget icon() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      height: 180,
      width: 180,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/monkey.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
