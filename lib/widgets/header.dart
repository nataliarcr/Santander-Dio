// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:santander_app/models/user_model/user_model.dart';
import '../shared/colors.dart';
import '../shared/settings.dart';

class HeaderWidget extends StatefulWidget {
  final UserModel user;
  const HeaderWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        height: 150,
        width: AppSettings.screenWidth,
        color: ColorsApp.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Olá, ${widget.user.name}",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Text(
              "Ag ${widget.user.account!.agency} Cc ${widget.user.account!.number}",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.18,
                  color: Colors.white),
            )
          ],
        ),
      );
}
