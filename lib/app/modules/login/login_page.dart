import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0XFF0092b9),
            Color(0XFF0167B2),
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/logo.png')),
            SizedBox(
              height: screenSize.height * .1,
            ),
            SizedBox(
              width: screenSize.width * .8,
              height: 49,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade200,
                ),
                child: Image.asset('assets/images/google.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
