import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../services/auth_services.dart';
import '../services/client.dart';

class AuthProviders extends ChangeNotifier {
  String token = "";
  User? user;

  void signUp(
      {required String username,
      required String password,
      required File image}) async {
    token = await AuthServices()
        .signup(username: username, password: password, image: image);

    setToken(token);
    print(token);

    //   notifyListeners();
  }

  Future<bool?> signIn(String username, String password) async {
    token = await AuthServices().signin(username, password);
    if (token.length > 2) return false;
    print(token);

    user = await User.fromJson(Jwt.parseJwt(token));

    // uuser = User(username: Username, password: Password );
    // print(token);
    // setToken(token);
    notifyListeners();
    return true;
  }

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
    // notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    token = "";
    notifyListeners();
  }

  bool get isAuth {
    getToken();
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      Client.dio.options.headers["Authorization"] = "Token $token";
      var json = Jwt.parseJwt(token);
      user = User.fromJson(json);
      print(user);
      return true;
    }
    logout();
    return false;
  }
}
