import 'package:delivery/src/register/register_controller.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _con = RegisterController();

  @override
  void initState() {
    super.initState();
    _con.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 120),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imageUser(),
                    const SizedBox(
                      height: 20,
                    ),
                    _textFieldEmail(),
                    _textFieldName(),
                    _textFieldLastName(),
                    _textFieldPhone(),
                    _textFieldPassword(),
                    _textFieldConfirmPassword(),
                    _buttonRegister(),
                  ],
                ),
              ),
            ),
            Positioned(
              left: -125,
              top: -125,
              child: _circleLogin(),
            ),
            Positioned(
              top: 50,
              left: 18,
              child: _textLogin(),
            ),
            Positioned(
              top: 37,
              left: -7,
              child: _iconBack(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleLogin() {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(125),
          color: MyColors.primaryColor),
    );
  }

  Widget _iconBack() {
    return IconButton(
        onPressed: _con.goToLoginPage,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ));
  }

  Widget _textLogin() {
    return const Text(
      'REGISTER',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          fontFamily: 'Roboto'),
    );
  }

  Widget _imageUser() {
    return CircleAvatar(
      backgroundImage: const AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Correo Electrónico',
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.email,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.nameController,
        decoration: const InputDecoration(
            hintText: 'Nombre',
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.person,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.lastnameController,
        decoration: const InputDecoration(
            hintText: 'Apellido',
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.person_outline,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
            hintText: 'Telefono',
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.phone,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Contraseña',
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.confirmPasswordController,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Confirmar Contraseña',
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: ElevatedButton(
        onPressed: _con.register,
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 15)),
        child: const Text('REGISTRARSE'),
      ),
    );
  }
}
