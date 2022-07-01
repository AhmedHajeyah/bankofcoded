import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../services/auth_services.dart';
import '../services/client.dart';

class AuthProviders extends ChangeNotifier {
  late User user;
  late String token = "";

  void signUp(User user) async {
    token = await AuthServices().signUp(user);
    setToken(token);
    print(token);
    //   notifyListeners();
  }

  void signIn(User user) async {
    token = await AuthServices().signIn(
      user,
    );
    setToken(token);
    this.user = user;
    print(token);
    notifyListeners();
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
