import 'package:dicoding_assignment/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_assignment/widget/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String email = "";
  String password = "";

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUser(email, password) {
    setState(() {
      email = emailController.text;
      password = passwordController.text;
      print(email + password);
      if (email == "arlinnoganda@gmail.com" && password == "12345678") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Welcome Home"),
        ));
      } else if (email.isNotEmpty && email != "arlinnoganda@gmail.com") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email Salah')),
        );
      } else if (password.isNotEmpty && password != "12345678") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password Salah')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please Fill Username and Password')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFFEBFDF0),
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Welcome back!!",
                  style: TextStyle(fontFamily: "Yellowtail", fontSize: 30),
                ),
                const Text(
                  "Search Your Best Hotel in Blitar",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text("Usename"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter Your Email',
                  obsecureText: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Password"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: passwordController,
                    hintText: 'Enter Your Email',
                    obsecureText: true),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 12),
                    )),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        signUser(email, password);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B4947)),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                )
              ],
            )),
      ]),
    );
  }
}
