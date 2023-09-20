import 'package:flutter/material.dart';
import 'package:networking_listview/utils/Constants.dart';

import '../bg_image.dart';
import '../drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _current_index = 0;
  var tabs =[
    const Center(child: Text("Home")),
    const Center(child: Text("Search")),
    const Center(child: Text("settings")),
    const Center(child: Text("Search")),
  ];

  TextEditingController _nameController = TextEditingController();
  var myText = "change me";
  var url = "https://jsonplaceholder.typicode.com/photos";

  var data;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    var response = await http.get(Uri.parse(url));
    data = jsonDecode(response.body);

    print("jpn==${data}");

    setState(() {

    });

    print("---== response==${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome in my App"),
        actions: [
          IconButton(
              onPressed: () {
                Constants.prefs.setBool("loggedIn", false);
                Navigator.pushReplacementNamed(context, "/login");
              },
              icon: const Icon(Icons.logout))
        ],
        backgroundColor: Colors.purple,
      ),
      body:

      // tabs[_current_index]
      Padding(
        padding: EdgeInsets.all(8.0),
        child: data != null
            ? ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(data[index]["title"]),
                    subtitle: Text("Id = ${data[index]["id"]}"),
                    leading: Image.network(data[index]["url"]),
                  ),
                );
              })
            : Center(
                child: CircularProgressIndicator(),
              ),
      )
      ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current_index,
        // iconSize: 30,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.blue,
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              backgroundColor: Colors.green,
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              backgroundColor: Colors.pink,
              label: 'settings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              backgroundColor: Colors.red,
              label: 'Search'),
        ],
        onTap: (index) {
          setState(() {
            _current_index = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Sending = $myText"),
          ));
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
