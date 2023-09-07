import 'package:flutter/material.dart';

class RegisterController {
  BuildContext? context;
  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToLoginPage() {
    Navigator.pushNamed(context!, 'login');
  }
}
