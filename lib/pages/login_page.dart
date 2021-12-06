import 'package:flutter/material.dart';
import 'package:indigenous_app/methods/auth_methods.dart';
import 'package:indigenous_app/pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthMethods _authMethods = AuthMethods();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                    child: 'LOGIN TO YOUR ACCOUNT'
                        .text
                        .bold
                        .size(30)
                        .color(Theme.of(context).primaryColor)
                        .make())
                .p4(),
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                label: 'Email'.text.make(),
              ),
              controller: _emailController,
            ).pOnly(top: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                label: 'Password'.text.make(),
              ),
              obscureText: true,
              controller: _passwordController,
            ).pOnly(top: 10),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  _authMethods
                      .signin(_emailController.text, _passwordController.text)
                      .then((value) {
                    // print(value);

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                        (route) => false);
                  });
                } else {
                  VxToast.show(context,
                      msg: 'Email or password cannot be blank');
                }
              },
              child: 'LOGIN TO YOUR ACCOUNT'.text.bold.size(20).make(),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
            ).wPCT(context: context, widthPCT: 100).h(60).pSymmetric(v: 10),
          ],
        ).p16(),
      ),
    );
  }
}
