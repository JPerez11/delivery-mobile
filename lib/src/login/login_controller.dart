import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:delivery/src/provider/user_provider.dart';
import 'package:delivery/src/utils/my_snackbar.dart';
import 'package:delivery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class LoginController {
  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserProvider userProvider = new UserProvider();
  SharedPref _sharedPref = new SharedPref();

  Future? init(BuildContext context) async {
    this.context = context;
    await userProvider.init(context);

    dynamic token = await _sharedPref.read('token');
    print('Login controller: $token');

    if (token != false) {
      print("Recopilando caché:");
      Navigator.pushNamedAndRemoveUntil(
          context, 'client/products/list', (route) => false);
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      MySnackbar.show(context!, 'Por favor ingrese todos los campos');
      return;
    }

    if (!emailValidate(email)) {
      MySnackbar.show(context!, 'El email no es valido');
      return;
    }
    ResponseApi responseApi = await userProvider.login(email, password);

    if (responseApi.success!) {
      String token = responseApi.data['session_token'];
      _sharedPref.save('token', token);

      userProvider.updateToken(email, token);

      Navigator.pushNamedAndRemoveUntil(
          context!, 'client/products/list', (route) => false);
    } else {
      MySnackbar.show(context!, responseApi.message!);
    }
    print('Email $email');
    print('Password $password');
  }

  bool emailValidate(String email) {
    final RegExp regex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return regex.hasMatch(email);
  }
}
