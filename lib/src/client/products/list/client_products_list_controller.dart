import 'package:delivery/src/models/user.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class ClientProductsListController {
  BuildContext? context;
  final SharedPref _sharedPref = SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  User? user;

  Future? init(BuildContext context) async {
    this.context = context;
    user = User.fromJson(await _sharedPref.read('user'));
  }

  logout() {
    _sharedPref.logout(context!);
  }
}
