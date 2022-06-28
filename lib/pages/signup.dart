import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  var _image;

  // final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 200,
                  width: 200,
                ),
                GestureDetector(
                  onTap: () async {
                    print("waiting");
                    final XFile? image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .timeout(Duration(seconds: 3));
                    print("done");

                    if (image == null) return;
                    setState(() {
                      _image = File(image.path);
                    });
                  },
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey,
                    backgroundImage:
                        _image == null ? null : Image.file(_image).image,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text("Please Sign Up")),
                Container(
                  margin: EdgeInsets.only(left: 35),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 35),
                  child: TextField(
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
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
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Signup"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void getImage(BuildContext context) {}

  // void setState(Null Function() param0) {}
}
