import 'dart:io';

import 'package:bankofcoded/services/client.dart';
import 'package:dio/dio.dart';
import '../models/user.dart';

class AuthServices {
  final _dio = Dio();

  Future<String> signup(
      {required String username,
      required String password,
      required File image}) async {
    late String token;

    try {
      FormData data = FormData.fromMap({
        "username": username,
        "password": password,
        "image": await MultipartFile.fromFile(image.path),
      });
      Response response = await Client.dio.post('/signup', data: data);
      token = response.data["token"];
      print(token);
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

  Future<String> signUp(User user) async {
    Response res = await Client.dio.post("/signup/", data: user.toJson());
    print(res.data["token"]);
    return res.data["token"];
  }

  Future<String> signIn(User user) async {
    Response res = await Client.dio.post("/signin/", data: user.toJson());
    print(res.data["token"]);
    return res.data["token"];
  }
}
