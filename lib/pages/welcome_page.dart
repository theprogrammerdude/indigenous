import 'package:flutter/material.dart';
import 'package:indigenous_app/pages/create_account.dart';
import 'package:indigenous_app/pages/login_page.dart';
import 'package:velocity_x/velocity_x.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                'Welcome to'.text.bold.size(22).make(),
                'Indigenous Connectivity App'
                    .toUpperCase()
                    .text
                    .bold
                    .size(26)
                    .color(Theme.of(context).primaryColor)
                    .align(TextAlign.center)
                    .make(),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: 'LOGIN'.text.bold.size(20).make(),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
            ).wPCT(context: context, widthPCT: 90).h(60).p8(),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAccount()));
              },
              child: 'CREATE ACCOUNT'
                  .text
                  .bold
                  .size(20)
                  .color(Theme.of(context).primaryColor)
                  .make(),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 2.0, color: Color(0xFF0072b1)),
              ),
            ).wPCT(context: context, widthPCT: 90).h(60).p8(),
          ],
        ),
      ),
    );
  }
}
