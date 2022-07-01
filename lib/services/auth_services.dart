import 'package:bankofcoded/services/client.dart';
import 'package:dio/dio.dart';
import '../models/user.dart';

class AuthServices {
  final _dio = Dio();

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
