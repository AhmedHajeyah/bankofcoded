import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import "package:bankofcoded/providers/auth_providers.dart";
import 'package:provider/provider.dart';

import '../models/user.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        body: SafeArea(
            minimum: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 275,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35),
                    child: const TextField(
                      //dd obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35),
                    child: TextField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthProviders>().signIn(User(
                              username: userController.text,
                              password: passwordController.text));
                          Navigator.popUntil(context, (route) {
                            return route.isFirst;
                          });
                          context.push('/main');
                        },
                        child: const Text("Signin"),
                      ),

                      // ElevatedButton.icon(
                      //     onPressed: (() {
                      //       context.pushNamed('/signup');
                      //     }),
                      //     icon: Icon(Icons.arrow_forward),
                      //     label: Text('Sign In')),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 55),
                    child: Row(
                      children: [
                        const Text(
                          "Not a User?",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 15, left: 10),
                          margin: EdgeInsets.only(top: 15),
                          child: InkWell(
                            child: ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context).push('/signup');
                              },
                              child: const Text("Signup"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}


//
                  //
                  //
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Enter your password',
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 75, top: 30),
                  //   child: Row(
                  //     children: [
                  //       const Text(
                  //         'Not a User?',
                  //         style: TextStyle(
                  //             fontSize: 20, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),