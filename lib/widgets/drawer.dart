import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUri='https://images.unsplash.com/photo-1625160531728-db2ad9969a0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80';
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(

          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountEmail: Text("Iqrar@gmail.com"),
                  accountName: Text("Iqrar Ijaz"),
                 //this provide rectangle image
                 // currentAccountPicture: Image.network(imageUri),
                  //for circular image we will use circular avatar
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUri),
                  ),
                )
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
              textScaleFactor: 1.3,
              style: TextStyle(
                color:Colors.white,
              ),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile",
                textScaleFactor: 1.3,
                style: TextStyle(
                  color:Colors.white,
                ),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.phone,
                color: Colors.white,
              ),
              title: Text("Phone",
                textScaleFactor: 1.3,
                style: TextStyle(
                  color:Colors.white,
                ),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail_solid,
                color: Colors.white,
              ),
              title: Text("Email",
                textScaleFactor: 1.3,
                style: TextStyle(
                  color:Colors.white,
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
