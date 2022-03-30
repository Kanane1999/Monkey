import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monkey/screens/auth/signup.dart';

class Login extends StatefulWidget {
  static String routeName = "login";

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TapGestureRecognizer? _forgotPassword;

  double longSpace = 15;
  double shortSpace = 10;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // titlePage(),
            // inputLog(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "Login",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget subtitle(String? subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "$subtitle",
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget textField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextField(
      
      ),
    );
  }

  Widget titlePage() {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget inputLog() {
    return Column(
      children: [
        const Text(
          "Entrer vos informations",
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: TextField(
            decoration: InputDecoration(
                hintText: "User Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: TextField(
            decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        custormButtom(
            color: Colors.deepOrangeAccent,
            title: "Login",
            colorText: Colors.white,
            onTap: () {}),
        const SizedBox(
          height: 10,
        ),
        message(),
        const SizedBox(
          height: 45,
        ),
        const Text(
          "Sign with:",
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        signBotton(
            color: Colors.blue,
            title: "Sign with Facebook",
            icon: Icons.facebook,
            colorText: Colors.white,
            onTap: () {}),
        const SizedBox(
          height: 15,
        ),
        signBotton(
            color: Colors.redAccent,
            title: "Sign with Google",
            icon: Icons.email,
            colorText: Colors.white,
            onTap: () {}),
        signUpText(),
      ],
    );
  }

  custormButtom({
    Color? color,
    String? title,
    Color? colorText,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(
          15,
        ),
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(.15),
                offset: const Offset(0, 5),
                blurRadius: 5),
          ],
          borderRadius: BorderRadius.circular(100),
          color: color,
        ),
        child: Text(
          "$title",
          style: TextStyle(
            color: colorText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget signBotton({
    Color? color,
    String? title,
    IconData? icon,
    Color? colorText,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(
          15,
        ),
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(.15),
                offset: const Offset(0, 5),
                blurRadius: 5),
          ],
          borderRadius: BorderRadius.circular(100),
          color: color,
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 80),
            ),
            Icon(
              icon,
              size: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorText,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget message() {
    return InkWell(
      onTap: () {},
      child: const Text(
        "Mot de pass Oublié",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget signUpText() {
    return Padding(
      padding: const EdgeInsets.only(left: 130, top: 100),
      child: Row(
        children: [
          const Text("Vous n'avez pas de compte?"),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, Signup.routeName);
            },
            child: const Text(
              "SignUp",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
