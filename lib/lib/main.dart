import 'package:flutter/material.dart';
//import './screens/servercall.dart';
//import './screens/player.dart';
import './screens/music.dart';
void main(){
  runApp(MaterialApp(
    title: 'Music player',
    debugShowCheckedModeBanner: false,


    home: Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 6.0,
        backgroundColor: Colors.purple,


        title: Text(
          'Music Player',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      body: Container(
        child: ServerCall(
        ),
//        child: Player(),
      ),
    ),
  ));
}