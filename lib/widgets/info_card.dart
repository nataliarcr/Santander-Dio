import 'package:flutter/cupertino.dart';
import 'package:santander_app/models/user_model/news.dart';

abstract class InfoCardsWidget extends StatefulWidget {
  final List<News> news;
  const InfoCardsWidget({super.key, required this.news});

  @override
  State<InfoCardsWidget> createState() => _InfoCardsState();
}

class _InfoCardsState extends State<InfoCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
