import 'package:anime_and_comic_entertainment/services/user_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        ElevatedButton(
            onPressed: () async {
              var pdata = {
                "name": "User1",
                "phoneNumber": "01234",
                "total": "10",
                "payed": "1",
                "debt": "0"
              };
              await Api.addUser(pdata);
            },
            child: Text("CREATE")),
        ElevatedButton(onPressed: () async {}, child: Text("READ")),
        ElevatedButton(onPressed: () async {}, child: Text("UPDATE")),
        ElevatedButton(onPressed: () async {}, child: Text("DELETE")),
        ElevatedButton(onPressed: () {}, child: Text(count.toString()))
      ]),
    );
  }
}
