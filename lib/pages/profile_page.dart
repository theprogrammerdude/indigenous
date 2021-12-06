import 'package:avatars/avatars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indigenous_app/methods/auth_methods.dart';
import 'package:indigenous_app/methods/db_methods.dart';
import 'package:indigenous_app/models/user_model.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthMethods _authMethods = AuthMethods();
  final DbMethods _dbMethods = DbMethods();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _taglineController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _industryController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _dbMethods.getUserData(_authMethods.currentUser()!.uid),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data!.data());
          UserModel _user =
              UserModel.fromMap(snapshot.data!.data() as Map<String, dynamic>);

          return Scaffold(
            appBar: AppBar(
              title: _user.username.text.make(),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: Center(
              child: Column(
                children: [
                  Avatar(
                    name: _user.firstName + _user.lastName,
                  ).pSymmetric(v: 15),
                  (_user.firstName + ' ' + _user.lastName)
                      .text
                      .bold
                      .capitalize
                      .size(24)
                      .make(),
                  OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            width: 2.0, color: Color(0xFF0072b1)),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    'Update Personal Section'
                                        .text
                                        .bold
                                        .size(18)
                                        .make(),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        label: 'First Name'.text.make(),
                                      ),
                                      textCapitalization:
                                          TextCapitalization.words,
                                      controller: _firstNameController
                                        ..text = _user.firstName
                                            .allWordsCapitilize(),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        label: 'Last Name'.text.make(),
                                      ),
                                      textCapitalization:
                                          TextCapitalization.words,
                                      controller: _lastNameController
                                        ..text =
                                            _user.lastName.allWordsCapitilize(),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        label: 'Tagline'.text.make(),
                                      ),
                                      controller: _taglineController
                                        ..text = _user.tagline,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        label: 'Email'.text.make(),
                                      ),
                                      controller: _emailController
                                        ..text = _user.email,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        label: 'Current Position'.text.make(),
                                      ),
                                      controller: _jobController
                                        ..text = _user.job,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        label: 'Industry'.text.make(),
                                      ),
                                      controller: _industryController
                                        ..text = _user.industry,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        label: 'Education'.text.make(),
                                      ),
                                      controller: _educationController
                                        ..text = _user.education,
                                    ),
                                    ElevatedButton(
                                            onPressed: () {},
                                            child:
                                                'Update'.text.size(20).make())
                                        .wPCT(context: context, widthPCT: 100)
                                        .h(50)
                                        .pSymmetric(v: 10)
                                  ],
                                ).p12(),
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Color(0xFF0072b1),
                      ),
                      label: 'Edit Profile'
                          .text
                          .color(Theme.of(context).primaryColor)
                          .make()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          'Connections'.text.bold.make(),
                          '0'.text.bold.italic.make(),
                        ],
                      ),
                      Column(
                        children: [
                          'Posts'.text.bold.make(),
                          '0'.text.bold.italic.make(),
                        ],
                      ),
                    ],
                  ).pSymmetric(v: 10),
                  Container(
                    decoration: const BoxDecoration(
                        color: Vx.gray200,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'About'
                                .text
                                .bold
                                .size(24)
                                .color(Theme.of(context).primaryColor)
                                .make(),
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            'Update About Section'
                                                .text
                                                .bold
                                                .size(18)
                                                .make(),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                label: 'About Me'.text.make(),
                                              ),
                                              controller: _aboutController
                                                ..text = _user.about,
                                            ),
                                            ElevatedButton(
                                                    onPressed: () {
                                                      _dbMethods
                                                          .updateAbout(
                                                              _aboutController
                                                                  .text
                                                                  .toLowerCase(),
                                                              _authMethods
                                                                  .currentUser()!
                                                                  .uid)
                                                          .then((value) =>
                                                              Navigator.pop(
                                                                  context));
                                                    },
                                                    child: 'Update'
                                                        .text
                                                        .size(20)
                                                        .make())
                                                .wPCT(
                                                    context: context,
                                                    widthPCT: 100)
                                                .h(50)
                                                .pSymmetric(v: 10)
                                          ],
                                        ).p12();
                                      });
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Color(0xFF0072b1),
                                )),
                          ],
                        ).p8(),
                        _user.about.toString() != ''
                            ? _user.about.text.size(18).make().pSymmetric(v: 10)
                            : 'Write something about yourself'
                                .text
                                .size(18)
                                .make()
                                .pOnly(bottom: 15),
                      ],
                    ),
                  )
                ],
              ).p8(),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
