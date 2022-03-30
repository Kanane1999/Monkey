import 'package:flutter/material.dart';
import 'package:monkey/screens/auth/login.dart';

class Signup extends StatefulWidget {
  static String routeName = "sign_up";
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              titlePage(),
              inputSignUp(),
              const SizedBox(
                height: 20,
              ),
              custormButtom(
                  color: Colors.deepOrangeAccent,
                  title: "Sign Up",
                  colorText: Colors.white,
                  onTap: () {}),
              signUpText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titlePage() {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget inputSignUp() {
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
                hintText: "First Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: TextField(
            decoration: InputDecoration(
                hintText: "Last Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: TextField(
            decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: TextField(
            decoration: InputDecoration(
                hintText: "Adresse",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ),
        const SizedBox(
          height: 20,
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
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: TextField(
            decoration: InputDecoration(
                hintText: "Confirm Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ),
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

  Widget signUpText() {
    return Padding(
      padding: const EdgeInsets.only(left: 155, top: 60),
      child: Row(
        children: [
          const Text("Vous avez compte"),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, Login.routeName);
            },
            child: const Text(
              "Sign In",
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
