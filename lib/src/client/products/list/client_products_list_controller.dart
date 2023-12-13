import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:delivery/src/provider/user_provider.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ClientProductsListController {
  BuildContext? context;
  final SharedPref _sharedPref = SharedPref();
  UserProvider userProvider = new UserProvider();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  User? user;

  Future? init(BuildContext context) async {
    this.context = context;
    dynamic token = await _sharedPref.read('token');
    Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
    ResponseApi response = await userProvider.getByEmail(decodedToken['email']);
    user = User.fromJson(response.data);
  }

  logout() {
    _sharedPref.logout(context!);
  }
}
