import 'package:flutter/material.dart';
import 'package:music_player/pages/settings_page.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override 
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor:Theme.of(context).colorScheme.surface,
      child: Column(
        children:[
          DrawerHeader(
            child:Center(
              child:Icon(
                Icons.music_note,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:25.0,top:25),
            child: ListTile(
              title:Padding(
              padding: const EdgeInsets.only(left:16.0),
              child:const Text("H O M E")
              ),
              leading:const Icon(Icons.home),
              onTap:()=> Navigator.pop(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:25.0,top:10),
            child: ListTile(
              title: Padding(
              padding: const EdgeInsets.only(left:16.0),
              child:const Text("S E T T I N G S")
              ),
              leading: Icon(Icons.home),
              onTap:() {

                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context)=> SettingsPage(),
                  )
                );
              }
            ),
          ),
        ],
      )
    );

  }
}