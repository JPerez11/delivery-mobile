import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:delivery/src/provider/user_provider.dart';
import 'package:delivery/src/utils/my_snackbar.dart';
import 'package:delivery/src/utils/shared_pref.dart';
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
  SharedPref _sharedPref = new SharedPref();

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

    if (!emailValidate(email)) {
      MySnackbar.show(context!, 'El email no es valido');
      return;
    }

    ResponseApi userByEmail = await userProvider.getByEmail(email);

    if (userByEmail.data != null) {
      MySnackbar.show(
          context!, 'Ya existe un usuario registrado con ese correo');
      return;
    }

    if (phone.contains(RegExp('[A-Za-z]'))) {
      MySnackbar.show(context!, 'El campo telefono debe ser numérico');
      return;
    }

    ResponseApi userByPhone = await userProvider.getByPhone(phone);

    if (userByPhone.data != null) {
      MySnackbar.show(
          context!, 'Ya existe un usuario registrado con ese telefono');
      return;
    }

    if (password.length < 8) {
      MySnackbar.show(context!, 'La contraseña tiene menos de 8 digitos');
      return;
    }

    if (confirmPassword != password) {
      MySnackbar.show(context!, "Las contraseñas no coinciden");
      return;
    }

    User user = User(
        email: email,
        password: password,
        name: name,
        lastname: lastname,
        phone: phone);

    ResponseApi userRegister = await userProvider.create(user);
    print('Respuesta al register: ${userRegister.toJson()}');

    ResponseApi responseLogin = await userProvider.login(email, password);
    print('Respuesta al login: ${responseLogin.toJson()}');
    if (userRegister.success!) {
      _sharedPref.save('token', responseLogin.data['session_token']);
      Navigator.pushNamedAndRemoveUntil(
          context!, 'client/products/list', (route) => false);
    } else {
      MySnackbar.show(context!, userRegister.message!);
    }
  }

  void goToLoginPage() {
    Navigator.pushNamed(context!, 'login');
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
