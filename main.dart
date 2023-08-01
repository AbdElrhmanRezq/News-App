import 'package:flutter/material.dart';
import 'package:news_app/screens/main_screen.dart';
import 'package:news_app/screens/new_view.dart';
import 'package:news_app/web_service.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    APIHelper.comingNews().then((value) {
      APIHelper.news.addAll(value);
      APIHelper.newsInApp = APIHelper.news;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: 'mainScreen', routes: {
      'mainScreen': (context) => const MainScreen(),
      'newView': (context) => const NewView(),
    });
  }
}
