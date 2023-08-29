import 'package:flutter/material.dart';

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

  TextEditingController _nameController = TextEditingController();
  var myText = "change me";
  var url = "https://jsonplaceholder.typicode.com/photos";

  var data;

  @override
  void initState() {
    super.initState();


    getData();

  }

  getData() async{
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
        title:  Text("Welcome in my App"),
        backgroundColor: Colors.purple,
      ),
      body:  Padding(
        padding:  EdgeInsets.all(8.0),
        child: data!=null?
         ListView.builder(
             itemBuilder: (context,index){
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ListTile(
                   title: Text(data[index]["title"]),
                   subtitle: Text("Id = ${data[index]["id"]}"),
                   leading: Image.network(data[index]["url"]),
                 ),
               );
             }
         )
            : Center(
            child:
            CircularProgressIndicator(),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        myText =_nameController.text;
        setState(() {

        });
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text("Sending = $myText"),
        ));
      },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
      ),
    ); }
}