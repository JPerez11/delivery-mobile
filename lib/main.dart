import 'package:delivery/src/client/products/list/client_products_list_page.dart';
import 'package:delivery/src/login/login_page.dart';
import 'package:delivery/src/register/register_page.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App Flutter',
      initialRoute: 'login',
      routes: {
        'login': ((BuildContext context) => const LoginPage()),
        'register': ((BuildContext context) => const RegisterPage()),
        'client/products/list': ((BuildContext context) =>
            const ClientProductsListPage())
      },
      theme: ThemeData(primaryColor: MyColors.primaryColor),
    );
  }
}
