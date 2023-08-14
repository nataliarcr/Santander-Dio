// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:santander_app/models/user_model/news.dart';
import 'package:santander_app/shared/colors.dart';
import 'package:santander_app/shared/pictures.dart';
import 'package:santander_app/shared/settings.dart';

class InfoCardsWidget extends StatefulWidget {
  final List<News> news;
  const InfoCardsWidget({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  State<InfoCardsWidget> createState() => _InfoCardsWidgetState();
}

class _InfoCardsWidgetState extends State<InfoCardsWidget> {
  final PageController _pageController = PageController();
  int cardPosition = 0;
  var icons = <Widget>[];

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.news.length; i++) {
      icons.add(
        Container(
          margin: const EdgeInsets.all(4),
          child: SvgPicture.asset(
            cardPosition == i ? ImagesApp.circulo : ImagesApp.aMais,
            semanticsLabel: '',
            height: 14,
          ),
        ),
      );
    }
  }

  Widget getFeatureCard(String image, String description) {
    return Card(
        child: Container(
      width: 333,
      height: 115,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //parte de dentro do card
          SvgPicture.network(
            image,
            semanticsLabel: '',
            colorFilter: ColorFilter.mode(ColorsApp.red, BlendMode.srcIn),
            width: 30,
            height: 30,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: Text(
            description,
            style: TextStyle(
              color: ColorsApp.grayDark,
              fontSize: 14,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.14,
            ),
          )),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          width: AppSettings.screenWidth,
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                cardPosition = index;
              });
            },
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: widget.news
                .map((e) => getFeatureCard(e.icon!, e.description!))
                .toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons,
        )
      ],
    );
  }
}
