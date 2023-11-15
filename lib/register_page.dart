import 'package:dicoding_assignment/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String username = "";
  String email = "";
  String password = "";
  String confirmPassword= "";

  @override
  dispose(){
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  
  void registerUser (username, email, password, confirmPassword) {
      setState(() {
        username = usernameController.text;
        email = emailController.text;
        password = passwordController.text;
        confirmPassword = confirmPasswordController.text;

        if(username.toString().isNotEmpty && email.toString().isNotEmpty && password.toString().isNotEmpty && confirmPassword.toString().isNotEmpty){
          if(password == confirmPassword) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const LoginPage();
            }));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Password dan Confirm Password harus sama"),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Harap Lengkapi Data"),
          ));

        }
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
        Container(
            color: const Color(0xFFEBFDF0),
            padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Create an Account",
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
                    controller: usernameController,
                    hintText: "Enter Username",
                    obsecureText: false,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Email"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Enter Your Email",
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
                    hintText: "Enter Your Password",
                    obsecureText: true
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Confirm Password"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: "Enter Your Confirm Password",
                    obsecureText: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            registerUser(username, email, password, confirmPassword);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3B4947)),
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const LoginPage();
                          }));
                        },
                        child: const Text(
                          "Already Have Account?",
                          style: TextStyle(fontSize: 12),
                        ),
                      )),
                ],
              ),
            )
          ]
      ),
    );
  }
}
