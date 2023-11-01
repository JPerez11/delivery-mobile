import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:delivery/src/provider/user_provider.dart';
import 'package:delivery/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UserProvider userProvider = UserProvider();

  Future? init(BuildContext context) {
    this.context = context;
    return null;
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      MySnackbar.show(context!, 'Debes ingresar todos los datos');
      return;
    }

    if (password.length < 8) {
      MySnackbar.show(context!, 'La contraseña tiene menos de 6 digitos');
      return;
    }

    if (confirmPassword != password) {
      throw Exception(
        const Text("Las contraseñas no coinciden"),
      );
    }

    User user = User(
        email: email,
        password: password,
        name: name,
        lastname: lastname,
        phone: phone);

    ResponseApi responseApi = await userProvider.create(user);

    MySnackbar.show(context!, responseApi.message!);
    print('Respuesta ${responseApi.toJson()}');
  }

  void goToLoginPage() {
    Navigator.pushNamed(context!, 'login');
  }
}
