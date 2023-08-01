import 'package:flutter/material.dart';
import 'package:news_app/web_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "News",
            style: TextStyle(color: Colors.purple),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh),
              color: Colors.purple,
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: APIHelper.newsInApp.length,
          itemBuilder: (context, idx) => ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'newView',
                    arguments: APIHelper.newsInApp[idx]);
              },
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    APIHelper.newsInApp[idx].publisher as String,
                    style: const TextStyle(color: Colors.purple, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    APIHelper.newsInApp[idx].title as String,
                    maxLines: 2,
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward))),
    );
  }
}
