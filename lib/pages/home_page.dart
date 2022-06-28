import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
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
                    child: TextField(
                      obscureText: _isObscure,
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
                        labelStyle: TextStyle(
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
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextButton(
                      child: Text(
                        'SignIn',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 55),
                    child: Row(
                      children: [
                        Text(
                          "Not a User?",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          child: Text(
                            'SignUp',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () {},
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