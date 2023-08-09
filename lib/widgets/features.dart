import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:santander_app/models/user_model/feature.dart';
import '../shared/colors.dart';
import '../shared/settings.dart';

class FeaturesWidget extends StatefulWidget {
  final List<Feature> features; //lista com as features
  const FeaturesWidget({super.key, required this.features});

  @override
  State<FeaturesWidget> createState() => _FeaturesWidgetState();
}

class _FeaturesWidgetState extends State<FeaturesWidget> {
  Widget getFeature(String icon, String description) {
    return Card(
        child: Container(
      width: 140,
      height: 125,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        shadows: [
          BoxShadow(
            color: ColorsApp.grayLight,
            blurRadius: 9,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //parte de dentro do card
          SvgPicture.network(
            icon,
            semanticsLabel: description,
            colorFilter: ColorFilter.mode(ColorsApp.red, BlendMode.srcIn),
            width: 30,
            height: 30,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            description,
            style: TextStyle(
              color: ColorsApp.grayLight,
              fontSize: 16,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.14,
            ),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 130,
      width: AppSettings.screenWidth,
      color: ColorsApp.whiteCuston,
      child: ListView(
        //criando elementos da lista
        scrollDirection: Axis.horizontal,
        children: widget.features
            .map((e) => getFeature(e.icon!, e.description!))
            .toList(),
      ),
    );
  }
}
