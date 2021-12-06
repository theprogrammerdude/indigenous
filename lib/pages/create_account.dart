import 'package:flutter/material.dart';
import 'package:indigenous_app/methods/auth_methods.dart';
import 'package:indigenous_app/methods/db_methods.dart';
import 'package:indigenous_app/pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthMethods _authMethods = AuthMethods();
  final DbMethods _dbMethods = DbMethods();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cnfPasswordController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Flexible(
                    child: 'CREATE ACCOUNT'
                        .text
                        .bold
                        .size(30)
                        .color(Theme.of(context).primaryColor)
                        .make())
                .p4(),
            const SizedBox(
              height: 20,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      label: 'First Name'.text.make(),
                    ),
                    textCapitalization: TextCapitalization.words,
                    controller: _firstNameController,
                  ).pOnly(top: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      label: 'Last Name'.text.make(),
                    ),
                    textCapitalization: TextCapitalization.words,
                    controller: _lastNameController,
                  ).pOnly(top: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      label: 'Username'.text.make(),
                    ),
                    controller: _usernameController,
                  ).pOnly(top: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      label: 'Email'.text.make(),
                    ),
                    controller: _emailController,
                  ).pOnly(top: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      label: 'Password'.text.make(),
                    ),
                    obscureText: true,
                    controller: _passwordController,
                  ).pOnly(top: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      label: 'Confirm Password'.text.make(),
                    ),
                    obscureText: true,
                    controller: _cnfPasswordController,
                  ).pOnly(top: 10),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                if (_firstNameController.text.isNotEmpty &&
                    _lastNameController.text.isNotEmpty &&
                    _emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty &&
                    _passwordController.text == _cnfPasswordController.text) {
                  _authMethods
                      .createAccount(
                          _emailController.text, _passwordController.text)
                      .then((value) {
                    // print(value);

                    _dbMethods.addUser(
                        _firstNameController.text.toLowerCase(),
                        _lastNameController.text.toLowerCase(),
                        _usernameController.text.toLowerCase(),
                        _emailController.text.toLowerCase(),
                        value.user!.uid);

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                        (route) => false);
                  });
                } else if (_passwordController.text !=
                    _cnfPasswordController.text) {
                  VxToast.show(context, msg: 'Passwords don\'t match');
                } else {
                  VxToast.show(context, msg: 'FIelds cannot be Empty');
                }
              },
              child: 'CREATE ACCOUNT'.text.bold.size(20).make(),
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
