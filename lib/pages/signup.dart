import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _image;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Center(
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
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _image = File(image!.path);
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
              const TextField(
                decoration: InputDecoration(
                  labelText: "Username",
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Signup"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getImage(BuildContext context) {}

  void setState(Null Function() param0) {}
}
