import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:santander_app/services/api.dart';
import 'package:santander_app/shared/colors.dart';
import 'package:santander_app/shared/pictures.dart';
import 'package:santander_app/shared/settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    //metdo principal quando é executada a class
    super.initState();
    fetch();
  }

  fetch() async {
    var user = await ApiApp.fetchUser(1);
    // print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(), //menu
      appBar: AppBar(
        backgroundColor:
            ColorsApp.red, //chamando cores definidas na pasta shared
        foregroundColor: Colors.white,
        title: Center(
          child: SvgPicture.asset(ImagesApp.logo, height: 24),
        ),

        actions: <Widget>[
          Container(
              margin: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(ImagesApp.notificacao, height: 24))
        ],
      ),
      body: Column(
        //
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            height: 150,
            width: AppSettings.screenWidth,
            color: ColorsApp.red,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Olá, @user",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  "Ag 0000 Cc 0000000-0",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.18,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
