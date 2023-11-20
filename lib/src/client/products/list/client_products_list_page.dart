import 'package:delivery/src/client/products/list/client_products_list_controller.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:delivery/src/widget/user_info_title.dart';

class ClientProductsListPage extends StatefulWidget {
  const ClientProductsListPage({Key? key});

  @override
  State<ClientProductsListPage> createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {
  final ClientProductsListController _con = ClientProductsListController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  void refreshData() {
    // Lógica para actualizar los datos o la interfaz aquí
    setState(() {
      // Actualizar datos o realizar acciones de actualización
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('My Profile',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: () {
            _con.logout();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              refreshData();
            },
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            child: const Text(
              'Refresh',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            color: MyColors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              onTap: () {
                print('Code to open file manager');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          image: AssetImage('assets/img/profile.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Change Profile Picture',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      SizedBox(width: 8),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'Email',
                  value: '${_con.user?.email ?? 'example@mail.com'}',
                  padding: const EdgeInsets.only(bottom: 16),
                  valueBackground: MyColors.primaryOpacityColor,
                ),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'Full Name',
                  value:
                      '${_con.user?.name ?? 'John'} ${_con.user?.lastname ?? 'Doe'}',
                  padding: const EdgeInsets.only(bottom: 16),
                  valueBackground: MyColors.primaryOpacityColor,
                ),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'Phone number',
                  value: '${_con.user?.phone ?? '0000000000'}',
                  padding: const EdgeInsets.only(bottom: 16),
                  valueBackground: MyColors.primaryOpacityColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
