import 'package:flutter/material.dart';
import 'package:music_player/components/neu_box.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget{
  const SongPage({super.key});

  @override 
  Widget build(BuildContext context){
    return Consumer<PlaylistProvider>(
      builder:(context,value,child) {

        final playlist=value.playlist;

        final currentSong=playlist[value.currentSongIndex ?? 0];


        return Scaffold(
          backgroundColor:Theme.of(context).colorScheme.surface,
      body:  SafeArea(
        child: Padding(
          padding:const EdgeInsets.only(left:25,right:25,top:25),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              IconButton(
                onPressed:()=> Navigator.pop(context),
                icon:Icon(Icons.arrow_back),
              ),
              Text("P L A Y L I S T"),

              IconButton(
                onPressed:(){},
                icon:Icon(Icons.menu),
              )
            ]
          ),
          const SizedBox(height:50),

          NeuBox(
            child: Column(
              children:[
                ClipRRect(
                  borderRadius:BorderRadius.circular(8),
                  child:Image.asset(currentSong.albumArtImagePath)
                ),
                 Padding(
                  padding:const EdgeInsets.all(15.0),
                  child:Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children:[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            currentSong.songName,
                            style:TextStyle(fontWeight:FontWeight.bold,
                            fontSize:20,
                            )
                          ),
                          Text(currentSong.artistName)
                        ]
                      ),
                      Icon(
                        Icons.favorite,
                        color:Colors.red,
                      )
                    ]
                  )
                ),
              ]
            )
            ),
            const SizedBox(height:25),

         Column(
          children:[
            const  Padding(
              padding: EdgeInsets.symmetric(horizontal:25.0),
                child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:[
                  Text("0:00"),
                  Icon(Icons.shuffle),
                  Icon(Icons.repeat),
                  Text("0:00"),
                ]
              ), 
            ),
            SliderTheme(
              data:SliderTheme.of(context).copyWith(
                thumbShape:
                const RoundSliderThumbShape(enabledThumbRadius: 0),
              ),
              child: Slider(
                min:0,
                max:value.totalDuration.inSeconds.toDouble(),
                value:value.currentDuration.inSeconds.toDouble(),
                activeColor:Colors.green,
                onChanged:(value){

                },
                onChangeEnd:(double double){
                  value.seek(Duration(seconds:double.toInt())); 
                }
              ),
            )
          ]
         ),

         const SizedBox(height:20),

         Row(
          children:[
           Expanded(
            child:GestureDetector(
              onTap:value.playPreviousSong,
              child: NeuBox(child: Icon(Icons.skip_previous))
            )
           ),

            const SizedBox(width:20),

           Expanded(
            flex:2,
            child:GestureDetector(
              onTap:value.pauseOrResume,
              child:  NeuBox(
                child: Icon(Icons.play_arrow))
            )
           ),
           const SizedBox(width:20),
           Expanded(
            child:GestureDetector(
            onTap:value.playNextSong,
            child:NeuBox(
              child:Icon(Icons.skip_next),
            )
            ),
           )
          ]
         )
         
          
        ]
      )
        )
      )
      );
      }
    );
  }
}