import 'package:days/NewsCard.dart';
import 'package:flutter/material.dart';

class NewsAppScreen extends StatefulWidget {
  const NewsAppScreen({super.key});

  @override
  State<NewsAppScreen> createState() => _NewsAppScreenState();
}

class _NewsAppScreenState extends State<NewsAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("News App")),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => NewsCard(),
        ));
  }
}
