import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:santander_app/models/user_model/card.dart';
import 'package:santander_app/shared/colors.dart';
import 'package:santander_app/shared/pictures.dart';

class CardWidget extends StatefulWidget {
  final CreditCard card;
  const CardWidget({super.key, required this.card});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      width: 350,
      height: 66,
      decoration: ShapeDecoration(
        color: ColorsApp.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 9,
            offset: Offset(4, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        //componentes um do lado do outro
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Cartão final: ${widget.card.number!.replaceRange(0, widget.card.number!.length - 4, '')}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.18,
            ),
          ),
          SvgPicture.asset(
            ImagesApp.down,
            width: 10,
            height: 10,
          ),
        ],
      ),
    );
  }
}
