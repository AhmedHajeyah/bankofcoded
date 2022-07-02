import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import "package:bankofcoded/providers/auth_providers.dart";
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import '../models/user.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  String password = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    // TextEditingController userController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();
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
                    child: TextFormField(
                        //dd obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        onChanged: (value) {
                          username = value;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35),
                    child: TextFormField(
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
                        onChanged: (value) {
                          password = value;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {
                        signIn(username, password);
                      },
                      child: const Text("Signin"),
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

  bool isLoading = false;
  void signIn(String username, String password) async {
    setState(() {
      isLoading = true;
    });

    bool? check = await Provider.of<AuthProviders>(context, listen: false)
        .signIn(username, password);

    if (check == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text("Login failed!"),
                content: Text("Incorrect username or password"),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      setState(() {
                        context.pop();
                      });
                    },
                    child: Text('Ok'),
                  ),
                ],
              ));
      isLoading = false;
    } else {
      isLoading = false;
      context.push('/main');
    }
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