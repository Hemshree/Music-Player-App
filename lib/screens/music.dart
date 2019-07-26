import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayer/audioplayer.dart';

class MySong {
  String artistName;
  String trackName;
  String previewUrl;

  MySong(this.trackName, this.artistName, this.previewUrl);
}

class ServerCall extends StatefulWidget {

  @override
  _ServerCallState createState() => _ServerCallState();

}

class _ServerCallState extends State<ServerCall> {

  List<MySong> songList = [];
  bool isPlay = true;

  callServer() async {
    var result = await http
        .get('https://itunes.apple.com/search?term=jack+johnson&limit=100');

    var obj = json.decode(result.body);

    var arr = obj['results'];


    List<MySong> songList2 = [];


    for (int i = 0; i < arr.length; i++){
      var songObj = arr[i];
      MySong song = new MySong(
          songObj['trackName'], songObj['artistName'], songObj['previewUrl']);
      songList2.add(song);
    }


    for (int i = 0; i < songList2.length; i++) {

    }
    setState(() {
      songList = songList2;
    });
  }

  _newList()
  {

    return  Container(
      child: ListView.builder(
          itemCount: songList.length,
          itemBuilder: (context, index) {
            return Row(

              children: <Widget>[
                Expanded(child:
                ListTile(
                  title: Text(songList[index].trackName),
                  subtitle: Text(songList[index].artistName),
                  //  trailing: Icon(Icons.play_arrow),

                ),
                  flex: 8,

                ),
                Expanded(
                  child: IconButton(

                    padding: EdgeInsets.all(7.0),
                    icon: Icon(isPlay? Icons.play_arrow:Icons.pause),
                    onPressed: () {

                      //  print("flow before pressed $boola");
                      bool bool1= _playSong(index ,);
                      print("after pressing button $bool1");

                    },
                  ),
                  flex: 1,
                ),

              ],
            );


          }),
    );
  }


  _playSong( index ) async {
    AudioPlayer audioPlayer = AudioPlayer();
    print("The song is $isPlay");

    if (isPlay ) {
      print("Song is $isPlay");
      await audioPlayer.play(
          songList[index].previewUrl);
      isPlay=false;


    }
    else
    {
      await audioPlayer.stop();
      print("now flow is in else statement $isPlay");
      isPlay=true;
      print("now flow is in else statement2 $isPlay");

    }

  }




  @override
  Widget build(BuildContext context) {
    callServer();
    return _newList();
  }
}