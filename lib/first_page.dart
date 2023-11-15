import 'package:dicoding_assignment/login_page.dart';
import 'package:dicoding_assignment/register_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEBFDF0),
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 50,
                fontFamily: "Yellowtail",
              ),
            ),
            const Text(
              "Search Your Best Hotel in Blitar",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              },
              style:
              ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3B4947)),
              child: const Text(
                "Sign with Google",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const RegisterPage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B4947)),
                child: const Text(
                  "Create an Account",
                  style: TextStyle(color: Colors.white),
                )),
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
                    "already have account? Sign in",
                    style: TextStyle(color: Colors.grey),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
