import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  const [
          UserAccountsDrawerHeader(
            accountName: Text("manu kashyap"),
            accountEmail: Text("manu@yopmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/05/Best-Image-Formats-Featured-Image.jpg?resize=1250,1120"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_alarm),
            subtitle: Text("sub title"),
            title: Text("data one",style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(Icons.account_circle_outlined),
          ),
          ListTile(
            leading: Icon(Icons.search_off),
            subtitle: Text("sub title"),
            title: Text("data two",style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(Icons.send),
          ),
          ListTile(
            leading: Icon(Icons.search_off),
            subtitle: Text("sub title"),
            title: Text("data three",style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(Icons.send),
          )

        ],),
    );
  }
}


