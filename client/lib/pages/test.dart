import 'package:anime_and_comic_entertainment/services/animes_api.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
            children: [ElevatedButton(onPressed: () {}, child: Text("test"))]),
      ),
    );
  }
}
