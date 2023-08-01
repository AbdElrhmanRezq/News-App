import 'package:flutter/material.dart';

import '../model.dart';

class NewView extends StatefulWidget {
  const NewView({super.key});

  @override
  State<NewView> createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {
  @override
  Widget build(BuildContext context) {
    var singleNews = ModalRoute.of(context)?.settings.arguments as News;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.purple,
          ),
          title: Text(
            singleNews.title as String,
            maxLines: 1,
            style: TextStyle(color: Colors.purple),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(singleNews.image as String)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Author: ${singleNews.author}",
                    style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    singleNews.title as String,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(singleNews.text as String),
                ),
                Text(
                  singleNews.publisher as String,
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
