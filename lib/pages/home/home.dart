import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:santander_app/models/user_model/user_model.dart';
import 'package:santander_app/services/api.dart';
import 'package:santander_app/shared/colors.dart';
import 'package:santander_app/shared/pictures.dart';
import 'package:santander_app/widgets/features.dart';
import 'package:santander_app/widgets/header.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel? user;
  @override
  void initState() {
    //metdo principal quando é executada a class
    super.initState();
    fetch();
  }

  fetch() async {
    user = await ApiApp.fetchUser(1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? const Scaffold(
            body: CircularProgressIndicator(),
          )
        : Scaffold(
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
                HeaderWidget(user: user!),
                FeaturesWidget(features: user!.features!),
              ],
            ),
          );
  }
}
