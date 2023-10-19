import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:delivery/src/provider/user_provider.dart';
import 'package:flutter/material.dart';

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  
  UserProvider userProvider = new UserProvider();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastname = lastnameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    User user = User(
      email: email,
      password: password,
      name: name,
      lastname: lastname,
      phone: phone
    );

    ResponseApi responseApi = await userProvider.create(user);

    print('Respuesta ${responseApi.toJson()}');
  }

  void goToLoginPage() {
    Navigator.pushNamed(context!, 'login');
  }
}
